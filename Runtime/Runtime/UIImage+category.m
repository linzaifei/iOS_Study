//
//  UIImage+category.m
//  Runtime
//
//  Created by zifei on 2021/2/22.
//

#import "UIImage+category.h"
#import <objc/message.h>
@implementation UIImage (category)

// 加载分类到内存的时候调用
+ (void)load{
   
    // 交换方法
    NSLog(@"加载中");
    
    Method se =  class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    Method next =class_getClassMethod([self class], @selector(imageViewName:));
    
    //  method_getImplementation(<#Method m#>)
    // 交换方法，相当于交换函数地址
    method_exchangeImplementations(se, next);
    
    
    
}

// 不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super.
// 既能加载图片又能打印
+(instancetype)imageViewName:(NSString *)name{

    UIImage*image = [UIImage imageViewName:name];
    if (image == nil) {
        NSLog(@"加载空的图片");
    }
    return image;
    
}


static char * const key = "name";
////动态添加属性
-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)name{
    return  objc_getAssociatedObject(self, key);
}
@end
