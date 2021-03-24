//
//  InteractiveTransition.h
//  专场动画
//
//  Created by zifei on 2021/3/8.
//

#import <UIKit/UIKit.h>
/**
 手势的方向枚举

 - GLPanEdgeTop:屏幕上方
 - GLPanEdgeLeft:屏幕左侧
 - GLPanEdgeBottom: 屏幕下方
 - GLPanEdgeRight: 屏幕右方
 */
typedef NS_ENUM(NSInteger,GLEdgePanGestureDirection) {
    GLPanEdgeTop    = 0,
    GLPanEdgeLeft,
    GLPanEdgeBottom,
    GLPanEdgeRight
};

NS_ASSUME_NONNULL_BEGIN

@interface InteractiveTransition : UIPercentDrivenInteractiveTransition
/**
 是否满足侧滑手势交互
 */
@property (nonatomic,assign) BOOL isPanGestureInteration;


/**
 转场时的操作 不用传参数的block
 */
@property (nonatomic,copy) dispatch_block_t eventBlcok;

/**
 添加侧滑手势

 @param view 添加手势的view
 @param direction 手势的方向
 */
- (void)addEdgePageGestureWithView:(UIView *)view direction:(GLEdgePanGestureDirection)direction;
@end

NS_ASSUME_NONNULL_END
