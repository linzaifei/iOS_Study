//
//  TransitionManager.m
//  专场动画
//
//  Created by zifei on 2021/3/8.
//

#import "TransitionManager.h"
#import "TransitionAnimation.h"
@interface TransitionManager()
/**
 入场动画
 */
@property(nonatomic,strong)TransitionAnimation *toTransitionAnimation;
/**
 退场动画
 */
@property (nonatomic,strong) TransitionAnimation *backTransitionAnimation;
@end
@implementation TransitionManager


//
//-(void)setToAnimation:(id<UIViewControllerContextTransitioning>)contextTransition{
//    
//}
//-(void)setBackAnimation:(id<UIViewControllerContextTransitioning>)contextTransition{
//    
//}

#pragma mark --- 非手势转场交互
/**
 for present
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.toTransitionAnimation;
}
/**
 for dismiss
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.backTransitionAnimation;
}
/**
 for push or pop
 注释:通过 fromVC 和 toVC 我们可以在此设置需要自定义动画的类
 */
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    if(operation == UINavigationControllerOperationPush){
        return self.toTransitionAnimation;
    }else if(operation == UINavigationControllerOperationPop){
        return self.backTransitionAnimation;
    }else{
        return  nil;
    }
    
}

#pragma mark ----懒加载
-(TransitionAnimation *)toTransitionAnimation{
    if (_toTransitionAnimation ==nil){
        __weak typeof(self) weakSelf = self;
        _toTransitionAnimation = [[TransitionAnimation alloc] initWithDuration:self.duration];
        _toTransitionAnimation.animationBlock = ^(id<UIViewControllerContextTransitioning>  _Nonnull contextTransition) {
            [weakSelf setToAnimation:contextTransition];
        };
    }
    return  _toTransitionAnimation;
}
- (TransitionAnimation *)backTransitionAnimation{
    if (nil == _backTransitionAnimation) {
        __weak typeof(self) weakSelf = self;
        _backTransitionAnimation = [[TransitionAnimation alloc] initWithDuration:self.duration];
        _backTransitionAnimation.animationBlock = ^(id<UIViewControllerContextTransitioning> contextTransition)
        {
            [weakSelf setBackAnimation:contextTransition];
        };
    }
    return _backTransitionAnimation;
}
@end
