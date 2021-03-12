//
//  KeyViewController.m
//  animation
//
//  Created by zifei on 2021/2/9.
//

#import "KeyViewController.h"

@interface KeyViewController ()

@end

@implementation KeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(40, 150, 200, 200)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
 
    [self animation7];
}

#pragma mark - CAKeyframeAnimation
-(void)animation7{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.rotation.z";
    animation.values = @[@(-M_PI/6),@0,@(M_PI/6)];
    animation.autoreverses = YES;
    animation.repeatCount = 100;
    animation.duration = 2;
    animation.fillMode = kCAFillModeBoth;
//    animation.calculationMode = kCAAnimationLinear;
    [self.redView.layer addAnimation:animation forKey:@"" ];
}

//animation - UIBezierPath
-(void)animation8{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";

    UIBezierPath *besizepath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 300, 300) cornerRadius:30];
 
    animation.path = besizepath.CGPath;
    animation.duration = 2;
    animation.repeatCount = 10;

    [self.redView.layer addAnimation:animation forKey:@""];
}

//animation -path
-(void)animation9{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(20, 20, 200, 200));
    
    animation.path = path;
    animation.duration = 2;
    animation.repeatCount = 10;
    animation.calculationMode =kCAAnimationLinear;
    [self.redView.layer addAnimation:animation forKey:@""];
}

-(void)animation10{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"contents";
    animation.values =@[(__bridge id) [UIImage imageNamed:@"4"].CGImage,(__bridge id) [UIImage imageNamed:@"5"].CGImage];
    animation.duration = 2;
    animation.repeatCount = 10;
    animation.calculationMode =kCAAnimationLinear;
    [self.redView.layer addAnimation:animation forKey:@""];
}

-(void)animation11{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.rotation.z";
    animation.values =@[@(-M_PI/6),@0,@(M_PI/6)];
    animation.duration = 2;
    animation.repeatCount = 10;
    animation.autoreverses= YES;
    animation.calculationMode =kCAAnimationLinear;
    [self.redView.layer addAnimation:animation forKey:@""];
}

-(void)animation12{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values =@[@0, @10, @-10, @0];
    animation.duration = 1;
    animation.additive = YES;
    animation.repeatCount = 10;
    animation.autoreverses= YES;
    animation.calculationMode =kCAAnimationLinear;
    [self.redView.layer addAnimation:animation forKey:@""];
}


@end
