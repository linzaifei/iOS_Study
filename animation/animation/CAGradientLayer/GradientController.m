//
//  GradientController.m
//  animation
//
//  Created by zifei on 2021/2/25.
//

#import "GradientController.h"

@interface GradientController ()
@property(nonatomic,strong)UIView *gradientView;
@end

@implementation GradientController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gradientView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 200, 200)];
    [self.view addSubview:self.gradientView];
    [self gradient];
    
    
}

-(void)gradient{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.gradientView.frame;
    
    layer.colors = @[(id)[UIColor orangeColor].CGColor,(id)[UIColor redColor].CGColor,(id)[UIColor orangeColor].CGColor];
    layer.locations = @[@0,@0.1,@0.2];
    layer.startPoint = CGPointMake(1, 0);
    layer.endPoint = CGPointMake(1, 1);
    layer.type = kCAGradientLayerAxial;

    [self.gradientView.layer addSublayer:layer];

    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"locations";
    animation.fromValue =@[@0,@0.1,@0.2];
    animation.toValue =@[@0.8,@0.9,@1];
    animation.duration = 3;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    
    [layer addAnimation:animation forKey:@""];
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
