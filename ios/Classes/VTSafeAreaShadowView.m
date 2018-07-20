#import "VTSafeAreaShadowView.h"

#import <React/RCTAssert.h>
#import <yoga/Yoga.h>

#import "VTSafeAreaHostShadowView.h"

@implementation VTSafeAreaShadowView {
    id<NSObject> _safeAreaObserver;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _safeAreaObserver = [[NSNotificationCenter defaultCenter] addObserverForName:VTSafeAreaHostDidUpdateNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [self handleSafeAreaUpdateInHost:note.object];
        }];
    }
    return self;
}

- (void)handleSafeAreaUpdateInHost:(VTSafeAreaHostShadowView*)hostView {
    CGRect rect = [self measureLayoutRelativeToAncestor:hostView];
    if (CGRectIsNull(rect)) {
        return;
    }
    CGRect safeRect = UIEdgeInsetsInsetRect(hostView.layoutMetrics.frame, hostView.safeAreaInsets);
    CGFloat left = CGRectGetMinX(rect) < CGRectGetMinX(safeRect) ? CGRectGetMinX(safeRect) - CGRectGetMinX(rect) : 0;
    CGFloat right = CGRectGetMaxX(rect) > CGRectGetMaxX(safeRect) ? CGRectGetMaxX(rect) - CGRectGetMaxX(safeRect) : 0;
    CGFloat top = CGRectGetMinY(rect) < CGRectGetMinY(safeRect) ? CGRectGetMinY(safeRect) - CGRectGetMinY(rect) : 0;
    CGFloat bottom = CGRectGetMaxY(rect) > CGRectGetMaxY(safeRect) ? CGRectGetMaxY(rect) - CGRectGetMaxY(safeRect) : 0;
    self.paddingLeft = (YGValue){left, YGUnitPoint};
    self.paddingRight = (YGValue){right, YGUnitPoint};
    self.paddingTop = (YGValue){top, YGUnitPoint};
    self.paddingBottom = (YGValue){bottom, YGUnitPoint};
    NSLog(@"shadow node %@ SafeAreaDidUpdate rect: %@, in safeRect: %@", self.reactTag, NSStringFromCGRect(rect), NSStringFromCGRect(safeRect));
    [self didSetProps:@[@"paddingLeft", @"paddingRight", @"paddingTop", @"paddingBottom"]];
}

- (void)dealloc {
    if (_safeAreaObserver) {
        [[NSNotificationCenter defaultCenter] removeObserver:_safeAreaObserver];
    }
}

@end
