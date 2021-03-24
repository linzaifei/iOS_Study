//
//  Trans.m
//  专场动画
//
//  Created by zifei on 2021/3/16.
//

#import "Trans.h"

int const  TransitionTypePresent = 0;
int const  TransitionTypeDismiss = 1;
@interface Trans()
@property(nonatomic,assign) TransitionType type;
@end
@implementation Trans

-(instancetype)initWithType:(TransitionType)type{
    if (self = [super init]) {
        self.type =type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    if (self.type ==TransitionTypePresent) {
        [self present:transitionContext];
    } else if (self.type ==TransitionTypeDismiss) {
        [self dismiss:transitionContext];
    }
    
}

-(void)present:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = transitionContext.containerView;
    
    //开始key
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //结束congtoller
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    /**
     snapshotViewAfterScreenUpdates可以对某个视图截图，我们采用对这个截图做动画代替直接对vc1做动画，因为在手势过渡中直接使用vc1动画会和手势有冲突， 如果不需要实现手势的话，就可以不是用截图视图了，大家可以自行尝试一下
     */
    //1.创建一个截图
    UIView *snaView = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    snaView.frame = fromVC.view.frame;
    //2.影藏from试图
    fromVC.view.hidden = YES;
    
    //3.把这个截图添加containerView在试图中 将截图视图和vc2的view都加入ContainerView中
    [containerView addSubview:snaView];
    [containerView addSubview:toVC.view];
   
  
    
    //设置toVC 试图大小
    toVC.view.frame = CGRectMake(0,containerView.frame.size.height, containerView.frame.size.width, 400);
    
    //开始动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.transform = CGAffineTransformMakeTranslation(0, -400);
        snaView.transform = CGAffineTransformMakeScale(0.85, 0.85);
    } completion:^(BOOL finished) {
      /**
       使用如下代码标记整个转场过程是否正常完成[transitionContext transitionWasCancelled]代表手势是否取消了，如果取消了就传NO表示转场失败，反之亦然，如果不用手势present的话直接传YES也是可以的，但是无论如何我们都必须标记转场的状态，系统才知道处理转场后的操作，否者认为你一直还在转场中，会出现无法交互的情况，切记
       */
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    
        if ([transitionContext transitionWasCancelled]) {
            fromVC.view.hidden = NO;
            [snaView removeFromSuperview];
        }
        
    }];
    
}

-(void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext{
  
    UIView *containerView =  [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    // //参照present动画的逻辑，present成功后，containerView的最后一个子视图就是截图视图，我们将其取出准备动画
    UIView *snpView = [containerView.subviews firstObject];
    
//    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.transform = CGAffineTransformIdentity;
        snpView.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        BOOL cancel = ![transitionContext transitionWasCancelled];
        [transitionContext completeTransition:cancel];
        if (cancel) {
            toVC.view.hidden = NO;
            [snpView removeFromSuperview];
        }
    }];
    
    
    NSLog(@"=====");
    
    
}
@end
