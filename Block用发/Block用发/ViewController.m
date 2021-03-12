//
//  ViewController.m
//  Block用发
//
//  Created by zifei on 2021/2/24.
//

#import "ViewController.h"
#import "Porson.h"
#import "NSObject+calculator.h"
#import "CalculatorManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self block1];
//
//    [self block2];
   
    [self block3];
}


#pragma mark -----  block开发中使用场景
/*

 1.把block保存到对象中,恰当时机的时候才去调用
 2.把block当做方法的参数使用,外界不调用,都是方法内部去调用,Block实现交给外界决定.
 3.把block当做方法的返回值,目的就是为了代替方法.,block交给内部实现,外界不需要知道Block怎么实现,只管调用

 */

-(void)block{
    Porson *p = [Porson new];
   
    //1.
    [p eat:1];
    
    //2
    [p eat1:^(int x) {
        NSLog(@"吃食物 %d",x);
    }];
    
    //3 :返回一个block
    [p eatFood:2](10);
    
    //4.
    [p eatFood1:^(int x) {
        NSLog(@"我吃 %d",x);
    }](100);
    
    //5
    [p eatfood2:^(int x) {
        NSLog(@"我吃2 %d",x);
    }](10);

    //6
    int x =  p.eatFood3(10);
    NSLog(@"x=%d",x);
}


#pragma mark -----  block链式编程
-(void)block1{
    CalculatorMaker *ca = [CalculatorMaker new];
    ca.add(10).add(20).add(10);
    NSLog(@"res = %d",ca.result);

}

-(void)block2{
    int s = [NSObject makerCalculaer:^(CalculatorMaker * _Nonnull maker) {
        maker.add(10).add(20).add(30);
    }];
    
    NSLog(@"res = %d",s);
}

#pragma mark -----  block函数编程
-(void)block3{
    CalculatorManager *manager = [[CalculatorManager alloc] init];
    int s = [[manager calculator:^int(int x) {
            x +=5;
            x= x*5;
            return x;
        }]reslut] ;
    
    NSLog(@"x = %d",s);
}




@end
