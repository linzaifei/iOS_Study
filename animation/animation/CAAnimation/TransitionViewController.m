//
//  TransitionViewController.m
//  animation
//
//  Created by zifei on 2021/2/9.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 150, 200, 200)];
    self.imageView.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:self.imageView];
    [self  animation];
    
}
-(void)animation{
    CATransition *animation = [CATransition animation];
    animation.type = @"caClose";
    animation.subtype = kCATransitionFromBottom;
    [self.imageView.layer addAnimation:animation forKey:@""];
    self.imageView.image = [UIImage imageNamed:@"5"];
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
