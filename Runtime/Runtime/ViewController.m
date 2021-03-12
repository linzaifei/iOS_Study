//
//  ViewController.m
//  Runtime
//
//  Created by zifei on 2021/2/22.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import "UIImage+category.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    [Person eat];
    
    Person *p = [[Person alloc] init];
    [p eat];
    
    
    [p performSelector:@selector(eat)];
 
    
    //动态添加一个方法
    Person *p1 = [Person new];
    [p1 performSelector:@selector(study)];
    
    
    Person *p2 = [Person new];

    [p2 performSelector:@selector(run)];
    
    
    
    
    extern int global;
    NSLog(@"wolail =%d",global);
    
    /*
     
     static修饰局部变量：将局部变量的本来分配在栈区改为分配在静态存储区，也就改变了局部变量的生命周期。
     static修饰全局变量：本来是在整个源程序的所有文件都可见，static修饰后，改为只在申明自己的文件可见，即修改了作用域

     const
     const修饰变量主要强调变量是不可修改的。我们看一下下面代码段：
     
     extern
     extern主要是用来引用全局变量，它的原理就是先在本文件中查找，本文件中查找不到再到其他文件中查找。
     常把extern和const联合使用在项目中创建一个文件，这个文件文件中包含整个项目中都能访问的全局常量。
     
     */
    static NSString const *str = @"123";
    str = @"234";
    NSLog(@"str=%@",str);
    
    static NSString * const str1 = @"123";
//    str1 = @"234";
    NSLog(@"str1=%@",str1);
    
    
    static const NSString *str2 = @"123";
    NSLog(@"str2=%@",str2);
    
    
    UIKIT_EXTERN int global;
    NSLog(@"---%d",global);
    
    
    
    
    
    
    
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeClose];
    btn.frame = CGRectMake(20, 100, 50, 50);
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 160, 100, 100)];
    
    imageView.image = [UIImage imageViewName:@"4"];
    
    [self.view addSubview:imageView];
    
}



-(void)onClick:(UIButton *)btn{
    NSTimeInterval time =  [[NSDate date] timeIntervalSince1970];
    NSLog(@"点击 %f",time);

    [self performSelector:@selector(request)];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self performSelector:@selector(request)];
        [self performSelector:@selector(request) withObject:nil afterDelay:0];
        [[NSRunLoop currentRunLoop] run];
    });
    
//    [self performSelector:@selector(request:) withObject:@"我是参数"];
    
}


-(void)request{
    
    NSLog(@"我去请求参数了");
}

-(void)request:(NSString *)name{
    
    NSLog(@"我去请求参数了,%@",name);
}


-(void)sub{
    NSArray *arr = @[@2, @3, @1, @2, @4, @3];
    
    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    for (int i =0; i<arr.count; i++) {
//        NSString *key = [NSString stringWithFormat:@"%@",arr[i]];
//        [dic setValue:[NSString stringWithFormat:@"%d",i] forKey:key];
//    }
//
//    NSLog(@"%@",dic);

    
    for (int i =0; i<arr.count; i++) {
        for (int j=i+1; j<arr.count; j++) {
            NSLog(@"x=%@  y=%@",arr[i],arr[j]);
            if(j-i==1 && [arr[i] intValue] +[arr[j] intValue]==3){
                NSLog(@"x=%d y=%d  vx=%@ vy=%@",i,j,arr[i],arr[j]);
            }
        }
    }
    
    
   
    
    
    
    
    
    
    
}

@end
