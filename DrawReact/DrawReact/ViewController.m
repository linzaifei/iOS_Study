//
//  ViewController.m
//  DrawReact
//
//  Created by zifei on 2021/2/7.
//

#import "ViewController.h"
#import "RedView.h"
#import "UIView+category.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RedView *redView = [[RedView alloc] initWithFrame:CGRectMake(50,100 , 300, 300)];
    redView.backgroundColor = [UIColor redColor];
    
    [redView addRadius:30 WithDirection:UIRectCornerTopLeft];
    
    [self.view addSubview:redView];
    
    
    
}


@end
