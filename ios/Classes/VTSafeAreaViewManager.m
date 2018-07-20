#import "VTSafeAreaViewManager.h"

#import <React/RCTUIManager.h>

#import "VTSafeAreaShadowView.h"

@implementation VTSafeAreaViewManager

RCT_EXPORT_MODULE()

- (VTSafeAreaShadowView *)shadowView {
  return [[VTSafeAreaShadowView alloc] init];
}

@end
