#import <UIKit/UIKit.h>

#import <React/RCTShadowView.h>

extern NSString* const VTSafeAreaHostDidUpdateNotification;

@interface VTSafeAreaHostShadowView : RCTShadowView

@property (nonatomic, assign, readonly) UIEdgeInsets safeAreaInsets;

- (void)setSafeAreaInsets:(UIEdgeInsets)insets;

@end
