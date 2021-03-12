//
//  ChartViewController.m
//  animation
//
//  Created by zifei on 2021/2/25.
//

#import "ChartViewController.h"
#import "LineChartView.h"
#import "BarChartView.h"
@interface ChartViewController ()
@property(nonatomic,strong)  LineChartView *lineV;
@property(nonatomic,strong)  BarChartView *barView;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lineV =  [[LineChartView alloc] initWithFrame:CGRectMake(10, 120, 300, 300)];
    [self .view addSubview:self.lineV];
    self.barView =  [[BarChartView alloc] initWithFrame:CGRectMake(10, 300, 300, 300)];
    [self .view addSubview:self.barView];
    
    
   
    UIButton *btn  =[ UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击一下生成charts" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 500, 200, 50);
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)click{
    [self.lineV startDraw];
    [self.barView startDraw];
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
