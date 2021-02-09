//
//  ViewController.m
//  animation
//
//  Created by zifei on 2021/2/5.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property(nonatomic,strong)UIView *redView;

@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.redView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 50, 50)];
//    self.redView.backgroundColor = [UIColor redColor];
//    self.redView.layer.contents =  (__bridge id) [UIImage imageNamed:@"4"].CGImage;
//    [self.view addSubview:self.redView];
//
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 100, 200, 200)];
    self.imageView.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:self.imageView];

 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(90, 400, 100, 50);
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(animation14) forControlEvents:UIControlEventTouchUpInside];
    
//    [self animation14];
    
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

#pragma mark - CAAnimationGroup
-(void)animation13{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"opacity";
    animation.toValue = @0;

    
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 200, 200)];
    animation1.path = path.CGPath;


    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animation1];
    group.duration = 5;
//    group.autoreverses = YES;
    group.repeatCount = MAXFLOAT;
    
    [self.redView.layer addAnimation:group forKey:@""];
    
    
}

#pragma mark - CATransition
-(void)animation14{
    CATransition *animation = [CATransition animation];
    animation.type = @"caClose";
    animation.subtype = kCATransitionFromBottom;
    
    [self.imageView.layer addAnimation:animation forKey:@""];
        
    self.imageView.image = [UIImage imageNamed:@"5"];
}




#pragma mark -- CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始");
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束 %d",flag);
}


@end
