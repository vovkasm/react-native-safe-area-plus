#import "VTSafeAreaHostShadowView.h"

NSString* const VTSafeAreaHostDidUpdateNotification = @"VTSafeAreaHostDidUpdate";

@implementation VTSafeAreaHostShadowView

- (CGRect)safeRect {
    return UIEdgeInsetsInsetRect(self.layoutMetrics.frame, _safeAreaInsets);
}

- (void)setSafeAreaInsets:(UIEdgeInsets)insets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_safeAreaInsets, insets)) {
        _safeAreaInsets = insets;
        [[NSNotificationCenter defaultCenter] postNotificationName:VTSafeAreaHostDidUpdateNotification object:self];
    }
}

- (void)layoutWithMetrics:(RCTLayoutMetrics)layoutMetrics layoutContext:(RCTLayoutContext)layoutContext {
    [super layoutWithMetrics:layoutMetrics layoutContext:layoutContext];
}

@end
