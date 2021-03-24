//
//  TransViewController.m
//  专场动画
//
//  Created by zifei on 2021/3/5.
//

#import "TransViewController.h"

@interface TransViewController ()

@end

@implementation TransViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 40, 50, 30);
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
}

-(void)dismiss{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
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
