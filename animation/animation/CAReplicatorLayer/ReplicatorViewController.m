//
//  ReplicatorViewController.m
//  animation
//
//  Created by zifei on 2021/3/8.
//

#import "ReplicatorViewController.h"

@interface ReplicatorViewController ()
@property(nonatomic,strong)CAReplicatorLayer *reLayer;
@end

@implementation ReplicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self demo1];
    
}


#pragma mark-- 加载框
-(void)demo{
    
    CAShapeLayer *la = [CAShapeLayer layer];
//    la.frame = CGRectMake(0, 0, 50, 50);
    UIBezierPath *p = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 15, 15)];
    la.path = p.CGPath;
    
    la.position =CGPointMake(100, 20);
    la.cornerRadius = 7.5;
    
    la.fillColor = [UIColor redColor].CGColor;
    

    
    self.reLayer = [CAReplicatorLayer layer];
    self.reLayer.frame = CGRectMake(200, 200, 200, 200);
    self.reLayer.instanceCount = 15;
    self.reLayer.backgroundColor = [UIColor orangeColor].CGColor;
    self.reLayer.instanceDelay = 0.5/15.0;
    CGFloat angle = 2 * M_PI / 15;
    CATransform3D tranform = CATransform3DIdentity;
    self.reLayer.instanceTransform = CATransform3DRotate(tranform, angle , 0, 0, 1);

    [self.reLayer addSublayer:la];

    [self.view.layer addSublayer:self.reLayer];


    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.duration = 0.5;
    animation.toValue = @(0.1);
    animation.repeatCount = MAXFLOAT;

    [la addAnimation:animation forKey:@""];
}

#pragma mark-- 加载框
-(void)demo1{

    CAShapeLayer *la = [CAShapeLayer layer];
    la.bounds = CGRectMake(0, 0, 30, 30);
    UIBezierPath *p = [UIBezierPath bezierPathWithRect:la.bounds];
    la.path = p.CGPath;
    la.anchorPoint = CGPointMake(0.5, 0.5);
    la.position =CGPointMake(100, 100);
    la.cornerRadius = 15;
    la.masksToBounds = YES;
    la.fillColor = [[UIColor  redColor] CGColor];
   
    
    self.reLayer = [CAReplicatorLayer layer];
    self.reLayer.frame = CGRectMake(200, 200, 200, 200);
    self.reLayer.instanceCount = 3;
    self.reLayer.instanceDelay = 0.3;
//    self.reLayer.instanceTransform = CATransform3DMakeScale(0.2, 0.2, 1);
    self.reLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.reLayer addSublayer:la];
    [self.view.layer addSublayer:self.reLayer];

    
    
    
    


    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.autoreverses = YES;
    group.duration = 1;
    group.repeatCount = MAXFLOAT;

    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.keyPath =@"opacity";
    ani.toValue=@0;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.toValue = @(3);

    group.animations = @[ani,animation];
    
    [la addAnimation:group forKey:@""];
}



#
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
