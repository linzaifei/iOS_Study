//
//  TransitionAnimation.h
//  专场动画
//
//  Created by zifei on 2021/3/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//contextTransition 将满足UIViewControllerContextTransitioning协议的对象传到管理内 在管理类对动画统一实现
typedef void(^TransitionAnimationBlock)(id <UIViewControllerContextTransitioning> contextTransition);

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,copy) TransitionAnimationBlock animationBlock;

/**
 初始化方法

 @param duration 转场时间
 @return 返回
 */
- (id)initWithDuration:(NSTimeInterval)duration;
@end

NS_ASSUME_NONNULL_END
