#import "VTSafeAreaHostViewManager.h"

#import "VTSafeAreaHostView.h"
#import "VTSafeAreaHostShadowView.h"

@implementation VTSafeAreaHostViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[VTSafeAreaHostView alloc] initWithBridge:self.bridge];
}

- (VTSafeAreaHostShadowView *)shadowView {
    return [[VTSafeAreaHostShadowView alloc] init];
}

@end
