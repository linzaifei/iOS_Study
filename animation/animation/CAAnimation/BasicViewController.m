//
//  BasicViewController.m
//  animation
//
//  Created by zifei on 2021/2/9.
//

#import "BasicViewController.h"

@interface BasicViewController ()<CAAnimationDelegate>

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(40, 150, 200, 200)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    [self animation];
}
#pragma mark - CABasicAnimation
//移动动画position
-(void)animation{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath=@"position.y";
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    animation.toValue =[NSValue valueWithCGPoint:CGPointMake(300, 300)];
    animation.byValue = @160;
    animation.repeatCount= MAXCOMLEN;
    animation.duration = 2;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.redView.layer addAnimation:animation forKey:@"baseanimation"];
}
//旋转
-(void)animation1{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath=@"transform.rotation.z";
    animation.fromValue = @0;
    animation.toValue =@1;
    animation.repeatCount= 1;
    animation.duration = 10;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.redView.layer addAnimation:animation forKey:@"baseanimation"];
}

//放大
-(void)animation2{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath=@"transform.scale";
    animation.fromValue = @1;
    animation.toValue =@1.4;
    animation.repeatCount= MAXCOMLEN;
    animation.duration = 1;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.redView.layer addAnimation:animation forKey:@"baseanimation"];
}

//角度
-(void)animation3{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath=@"cornerRadius";
    animation.fromValue = @0;
    animation.toValue =@30;
    animation.repeatCount= MAXCOMLEN;
    animation.duration = 1;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.redView.layer addAnimation:animation forKey:@"baseanimation"];
    [self.redView.layer maskedCorners];
}

//背景颜色
-(void)animation4{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath=@"backgroundColor";
    animation.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    animation.toValue =(__bridge id _Nullable)([UIColor orangeColor].CGColor);
    animation.repeatCount= MAXCOMLEN;
    animation.duration = 1;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.redView.layer addAnimation:animation forKey:@"baseanimation"];
}
//bounds
-(void)animation5{
//    bounds
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"bounds";
    animation.fromValue =[NSValue valueWithCGRect:CGRectMake(100, 100, 200, 200)];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(100, 120, 300, 300)];
    animation.duration = 3;
    animation.autoreverses = YES;
    [self.redView.layer addAnimation:animation forKey:@""];
}
//contents
-(void)animation6{
//    bounds
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"contents";
    animation.toValue = (__bridge id) [UIImage imageNamed:@"5"].CGImage;
    animation.duration = 3;
    animation.autoreverses = YES;
    [self.redView.layer addAnimation:animation forKey:@""];
    
    
    
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
