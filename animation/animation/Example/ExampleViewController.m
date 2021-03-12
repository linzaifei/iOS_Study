//
//  ExampleViewController.m
//  animation
//
//  Created by zifei on 2021/3/8.
//

#import "ExampleViewController.h"
#import "TvView.h"
@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    TvView *tv = [[TvView alloc] initWithFrame:CGRectMake(50, 200, 200, 150)];
    [self.view addSubview:tv];
    tv.backgroundColor = [UIColor redColor];
    
//    CATransform3D transform = CATransform3DIdentity;
//    transform.m34 = -1 / 400.0;
//    transform = CATransform3DRotate(transform, M_PI / 9 * 0.5, -1, 0, 0);
//    transform = CATransform3DRotate(transform, M_PI / 9 * 0.5, 0, 1, 0);
//    tv.layer.transform = transform;
    
    
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
