#import "VTSafeAreaHostShadowView.h"

NSString* const VTSafeAreaHostDidUpdateNotification = @"VTSafeAreaHostDidUpdate";

@implementation VTSafeAreaHostShadowView

- (void)setSafeAreaInsets:(UIEdgeInsets)insets {
    _safeAreaInsets = insets;
    NSLog(@"shadow SafeArea: %@", NSStringFromUIEdgeInsets(insets));
    [[NSNotificationCenter defaultCenter] postNotificationName:VTSafeAreaHostDidUpdateNotification object:self];
}

@end
