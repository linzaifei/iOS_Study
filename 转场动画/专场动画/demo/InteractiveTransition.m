//
//  InteractiveTransition.m
//  专场动画
//
//  Created by zifei on 2021/3/16.
//

#import "InteractiveTransition.h"

@implementation InteractiveTransition
- (void)addPanGestureForViewController:(UIViewController *)viewController{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [viewController.view addGestureRecognizer:pan];
    
    
    
    
}



-(void)handleGesture:(UIPanGestureRecognizer *)pan{
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateChanged:
            
            break;
        case UIGestureRecognizerStateEnded:
            
            break;
            
        default:
            break;
    }
    
}
@end
