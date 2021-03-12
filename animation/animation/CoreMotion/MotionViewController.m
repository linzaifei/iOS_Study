//
//  MotionViewController.m
//  animation
//
//  Created by zifei on 2021/3/8.
//

#import "MotionViewController.h"
#import "MotionView.h"
@interface MotionViewController ()

@end

@implementation MotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MotionView *motionView = [[MotionView alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    motionView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:motionView];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
