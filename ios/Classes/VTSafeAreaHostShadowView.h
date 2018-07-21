#import <UIKit/UIKit.h>

#import <React/RCTShadowView.h>

extern NSString* const VTSafeAreaHostDidUpdateNotification;

@interface VTSafeAreaHostShadowView : RCTShadowView

@property (nonatomic, assign, readonly) UIEdgeInsets safeAreaInsets;
@property (nonatomic, assign, readonly) CGRect safeRect;

- (void)setSafeAreaInsets:(UIEdgeInsets)insets;

@end
