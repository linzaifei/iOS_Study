//
//  ViewController.m
//  专场动画
//
//  Created by zifei on 2021/3/5.
//

#import "ViewController.h"
#import "TransViewController.h"
#import "Trans.h"
@interface ViewController () <UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    


    
    
    
    
    
}



- (IBAction)onclick:(id)sender {
    

    TransViewController *transViewCtrl = [[TransViewController alloc] init];
    transViewCtrl.modalPresentationStyle = UIModalPresentationCustom;
    transViewCtrl.transitioningDelegate = self;
    
    [self presentViewController:transViewCtrl animated:YES completion:NULL];
    
    
    
    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    //通过viewControllerForKey取出转场前后的两个控制器，这里toVC就是vc1、fromVC就是vc2
    
    return [[Trans alloc] initWithType:TransitionTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{

    return  [[Trans alloc] initWithType:TransitionTypeDismiss];
    
}

@end
