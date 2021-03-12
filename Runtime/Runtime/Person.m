//
//  Person.m
//  Runtime
//
//  Created by zifei on 2021/2/22.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person

+(void)eat{
    NSLog(@"类方法-吃");
}

-(void)eat{
    NSLog(@"对象方法-吃");
}


-(void)run{
    NSLog(@"跑步");
}


/*
 1、动态添加方法
 
 */
void study(id self,SEL sel)
{
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if(sel== @selector(study)){
        NSLog(@"有这个");
        
        class_addMethod(self, @selector(study), study, "v@:");
        
    }
    return [super resolveInstanceMethod:sel];
}




@end
