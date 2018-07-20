#import <UIKit/UIKit.h>

#import <React/RCTView.h>

NS_ASSUME_NONNULL_BEGIN

@class RCTBridge;

@interface VTSafeAreaView : RCTView

- (instancetype)initWithBridge:(RCTBridge *)bridge;

@end

NS_ASSUME_NONNULL_END
