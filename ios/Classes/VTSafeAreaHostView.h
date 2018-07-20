#import <UIKit/UIKit.h>

#import <React/RCTView.h>

@class RCTBridge;

@interface VTSafeAreaHostView : RCTView

- (instancetype)initWithBridge:(RCTBridge *)bridge;

@end
