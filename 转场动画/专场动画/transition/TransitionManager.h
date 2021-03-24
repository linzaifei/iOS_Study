//
//  TransitionManager.h
//  专场动画
//
//  Created by zifei on 2021/3/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransitionManager : NSObject<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
/*
 动画时间0.5s
 **/
@property(nonatomic,assign)NSTimeInterval duration;

/*
 入场动画
 contextTransition 实现动画
 */
-(void)setToAnimation:(id<UIViewControllerContextTransitioning>)contextTransition;


/*
 出场动画
 contextTransition 实现动画
 */
-(void)setBackAnimation:(id<UIViewControllerContextTransitioning>)contextTransition;

@end

NS_ASSUME_NONNULL_END
