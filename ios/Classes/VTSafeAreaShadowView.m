#import <React/RCTAssert.h>
#import <yoga/Yoga.h>

#import "VTSafeAreaShadowView.h"
#import "VTSafeAreaViewLocalData.h"

@implementation VTSafeAreaShadowView

- (void)setLocalData:(VTSafeAreaViewLocalData *)localData
{
  RCTAssert([localData isKindOfClass:[VTSafeAreaViewLocalData class]],
    @"Local data object for `VTSafeAreaShadowView` must be `VTSafeAreaViewLocalData` instance.");

  UIEdgeInsets insets = localData.insets;

  super.paddingLeft = (YGValue){insets.left, YGUnitPoint};
  super.paddingRight = (YGValue){insets.right, YGUnitPoint};
  super.paddingTop = (YGValue){insets.top, YGUnitPoint};
  super.paddingBottom = (YGValue){insets.bottom, YGUnitPoint};

  [self didSetProps:@[@"paddingLeft", @"paddingRight", @"paddingTop", @"paddingBottom"]];
}

/**
 * Removing support for setting padding from any outside code
 * to prevent interferring this with local data.
 */
- (void)setPadding:(YGValue)value {}
- (void)setPaddingLeft:(YGValue)value {}
- (void)setPaddingRight:(YGValue)value {}
- (void)setPaddingTop:(YGValue)value {}
- (void)setPaddingBottom:(YGValue)value {}

@end
