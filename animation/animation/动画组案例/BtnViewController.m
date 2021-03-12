//
//  BtnViewController.m
//  animation
//
//  Created by zifei on 2021/2/24.
//

#import "BtnViewController.h"
#import "CircleView.h"
@interface BtnViewController ()<CAAnimationDelegate,CircleDelegate>
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)CircleView *circleView;
@end

@implementation BtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.btn= [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.btn.frame = CGRectMake(100, 300, 160, 60);
    self.btn.layer.borderColor = [UIColor grayColor].CGColor;
    [self.btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.btn];
    [self.btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
  
    
    
}

-(void)onClick:(UIButton *)btn{
    

    
    
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath =@"backgroundColor";
    animation.toValue =(id) [UIColor colorWithWhite:0 alpha:0].CGColor;
    
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    animation1.keyPath =@"bounds";
    animation1.toValue = [NSValue valueWithCGRect:CGRectMake(150, 300, 60, 60)] ;
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath =@"cornerRadius";
    animation2.toValue = @30;
    
    CABasicAnimation *animation4 = [CABasicAnimation animation];
    animation4.keyPath =@"borderWidth";
    animation4.toValue = @2;
        
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animation1,animation2,animation4];
    group.duration = 3;
    group.fillMode=kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.delegate = self;
    [btn.layer addAnimation:group forKey:@"1"];
    
}

-(void)startAnimation{
    self.circleView = [[CircleView alloc] initWithFrame:self.btn.frame];
    self.circleView.delegate = self;
    [self.btn addSubview: self.circleView];
    [ self.circleView start];
    
}

#pragma mark - 动画代理
- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始");
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束");
    [self startAnimation];
}

-(void)circleAnimationStop{
    
    NSLog(@"圆形动画结束动画结束");
    [self.circleView removeFromSuperview];
    [self stopAnimation];
}

-(void)stopAnimation{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath =@"backgroundColor";
    animation.toValue =(id) [UIColor redColor].CGColor;
    
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    animation1.keyPath =@"bounds";
    animation1.toValue = [NSValue valueWithCGRect:CGRectMake(150, 300, 160, 60)] ;
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath =@"cornerRadius";
    animation2.toValue = @0;
    
    CABasicAnimation *animation4 = [CABasicAnimation animation];
    animation4.keyPath =@"borderWidth";
    animation4.toValue = @0;
        
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animation1,animation2,animation4];
    group.duration = 3;
    group.fillMode=kCAFillModeForwards;
    group.removedOnCompletion = NO;
 //group.delegate = self;
    
    [self.btn.layer addAnimation:group forKey:@"2"];
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
