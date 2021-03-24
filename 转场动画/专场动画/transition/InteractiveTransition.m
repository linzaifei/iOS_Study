//
//  InteractiveTransition.m
//  专场动画
//
//  Created by zifei on 2021/3/8.
//

#import "InteractiveTransition.h"
/** 手势交互管理类 */
@implementation InteractiveTransition

//- (void)handlePopRecognizer:(UIPanGestureRecognizer*)recognizer {
//    // 计算用户手指划了多远
//    
//    CGFloat progress = fabs([recognizer translationInView:self.gestureView].x) / (self.gestureView.bounds.size.width * 1.0);
//    progress = MIN(1.0, MAX(0.0, progress));
//        
//    switch (recognizer.state) {
//        case UIGestureRecognizerStateBegan:
//        {
//            _isPanGestureInteration = YES;
//            
//            if (self.eventBlcok) {
//                self.eventBlcok();
//            }
//            
//            // 创建过渡对象，弹出viewController
////
////            UIViewController *fromVc = [self gl_viewController];
////
////            switch (self.transitionType) {
////                case GLInteractiveTransitionPush:
////                {
////
////                }
////                    break;
////                case GLInteractiveTransitionPop:
////                {
////                    if (fromVc.navigationController) {
////                        [fromVc.navigationController popViewControllerAnimated:YES];
////                    }
////                }
////                    break;
////                case GLInteractiveTransitionPresent:
////                {
////
////                }
////                    break;
////                case GLInteractiveTransitionDismiss:
////                {
////                    [fromVc dismissViewControllerAnimated:YES completion:nil];
////                }
////                    break;
////                default:
////                    break;
////            }
//            break;
//        }
//        case UIGestureRecognizerStateChanged:
//        {
//            // 更新 interactive transition 的进度
//            [self updateInteractiveTransition:progress];
//            break;
//        }
//        case UIGestureRecognizerStateEnded:
//        case UIGestureRecognizerStateCancelled:
//        {
////            NSLog(@" 打印信息:%f",progress);
//            // 完成或者取消过渡
//            if (progress > 0.5) {
//                [self finishInteractiveTransition];
//            }
//            else {
//                [self cancelInteractiveTransition];
//            }
//            
//            _isPanGestureInteration = NO;
//            break;
//        }
//        default:
//            break;
//    }
//}

@end
