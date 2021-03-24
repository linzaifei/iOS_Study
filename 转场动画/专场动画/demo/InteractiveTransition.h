//
//  InteractiveTransition.h
//  专场动画
//
//  Created by zifei on 2021/3/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InteractiveTransition : UIPercentDrivenInteractiveTransition
- (void)addPanGestureForViewController:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
