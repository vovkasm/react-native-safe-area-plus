#import "VTSafeAreaHostView.h"

#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/RCTUIManagerUtils.h>

#import "VTSafeAreaHostShadowView.h"

@implementation VTSafeAreaHostView {
    __weak RCTBridge *_bridge;
    BOOL _safeAreaAvailable;
    UIEdgeInsets _safeInsets;
}

- (instancetype)initWithBridge:(RCTBridge *)bridge {
    if (self = [super initWithFrame:CGRectZero]) {
        _bridge = bridge;
        _safeAreaAvailable = [self respondsToSelector:@selector(safeAreaInsets)];
    }

    return self;
}

RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)decoder)
RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)

static BOOL UIEdgeInsetsEqualToEdgeInsetsWithThreshold(UIEdgeInsets insets1, UIEdgeInsets insets2, CGFloat threshold) {
    return
    ABS(insets1.left - insets2.left) <= threshold &&
    ABS(insets1.right - insets2.right) <= threshold &&
    ABS(insets1.top - insets2.top) <= threshold &&
    ABS(insets1.bottom - insets2.bottom) <= threshold;
}

// Emulate safe area for iOS < 11
- (void)layoutSubviews {
    [super layoutSubviews];
    if (@available(iOS 11.0, tvOS 11.0, *)) {
        if (_safeAreaAvailable) {
            [self setSafeInsets:self.safeAreaInsets];
            return;
        }
    }

    UIViewController* vc = self.reactViewController;
    if (!vc) {
        return;
    }
    CGFloat topLayoutOffset = vc.topLayoutGuide.length;
    CGFloat bottomLayoutOffset = vc.bottomLayoutGuide.length;
    CGRect safeArea = vc.view.bounds;
    safeArea.origin.y += topLayoutOffset;
    safeArea.size.height -= topLayoutOffset + bottomLayoutOffset;
    CGRect localSafeArea = [vc.view convertRect:safeArea toView:self];
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    if (CGRectGetMinY(localSafeArea) > CGRectGetMinY(self.bounds)) {
        safeAreaInsets.top = CGRectGetMinY(localSafeArea) - CGRectGetMinY(self.bounds);
    }
    if (CGRectGetMaxY(localSafeArea) < CGRectGetMaxY(self.bounds)) {
        safeAreaInsets.bottom = CGRectGetMaxY(self.bounds) - CGRectGetMaxY(localSafeArea);
    }

    [self setSafeInsets:safeAreaInsets];
}

- (void)setSafeInsets:(UIEdgeInsets)safeAreaInsets {
    if (UIEdgeInsetsEqualToEdgeInsetsWithThreshold(safeAreaInsets, _safeInsets, 1.0 / RCTScreenScale())) {
        return;
    }

    _safeInsets = safeAreaInsets;
    RCTUIManager* uiManager = _bridge.uiManager;

    RCTAssertMainQueue();

    NSNumber* tag = self.reactTag;
    RCTExecuteOnUIManagerQueue(^{
        VTSafeAreaHostShadowView* shadowView = (VTSafeAreaHostShadowView*)[uiManager shadowViewForReactTag:tag];
        if (shadowView == nil) {
            return;
        }
        [shadowView setSafeAreaInsets:safeAreaInsets];
        [uiManager setNeedsLayout];
    });

}

@end
