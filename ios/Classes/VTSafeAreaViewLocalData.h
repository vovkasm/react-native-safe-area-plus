#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VTSafeAreaViewLocalData : NSObject

- (instancetype)initWithInsets:(UIEdgeInsets)insets;

@property (atomic, readonly) UIEdgeInsets insets;

@end

NS_ASSUME_NONNULL_END
