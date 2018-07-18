#import "VTSafeAreaViewManager.h"

#import <React/RCTUIManager.h>

#import "VTSafeAreaShadowView.h"
#import "VTSafeAreaView.h"

@implementation VTSafeAreaViewManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [[VTSafeAreaView alloc] initWithBridge:self.bridge];
}

- (VTSafeAreaShadowView *)shadowView
{
  return [VTSafeAreaShadowView new];
}

@end
