//
//  TransitionAnimation.m
//  专场动画
//
//  Created by zifei on 2021/3/8.
//

#import "TransitionAnimation.h"
@interface TransitionAnimation()
@property(nonatomic,assign)NSTimeInterval durtion;
@end
@implementation TransitionAnimation
- (instancetype)initWithDuration:(NSTimeInterval)duration{
    if (self = [super init]) {
        self.durtion = duration;   
    }
    return self;
}
//- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
//    <#code#>
//}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return  self.durtion;
}

@end
