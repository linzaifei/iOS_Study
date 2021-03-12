//
//  GroupViewController.m
//  animation
//
//  Created by zifei on 2021/2/9.
//

#import "GroupViewController.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.redView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 50, 50)];
        self.redView.backgroundColor = [UIColor redColor];
        self.redView.layer.contents =  (__bridge id) [UIImage imageNamed:@"4"].CGImage;
        [self.view addSubview:self.redView];
        [self animation];
    
}

-(void)animation{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"opacity";
    animation.toValue = @0;

    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(30, 200, 200, 200)];
    animation1.path = path.CGPath;

    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"contents";
    animation2.toValue =  (__bridge id)[UIImage imageNamed:@"5"].CGImage;
    
    
    CAKeyframeAnimation *animation3 = [CAKeyframeAnimation animation];
    animation3.keyPath = @"transform.scale";
    animation3.values = @[@1,@1.2,@1.3,@1];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animation1,animation2,animation3];
    group.duration = 5;
    group.autoreverses = YES;
    group.repeatCount = MAXFLOAT;
    
    [self.redView.layer addAnimation:group forKey:@""];

    
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
