//
//  SpringController.m
//  animation
//
//  Created by zifei on 2021/2/18.
//

#import "SpringController.h"

@interface SpringController ()

@end

@implementation SpringController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(40, 150, 200, 200)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    [self animation];
}

-(void)animation{
    CASpringAnimation *spring = [CASpringAnimation animation];
    spring.keyPath = @"position.x";
    spring.toValue = @300;
    spring.duration = 2;
    spring.autoreverses = YES;
    spring.mass = 2;
    [self.redView.layer addAnimation:spring forKey:@"spring"];
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
