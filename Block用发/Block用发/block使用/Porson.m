//
//  Porson.m
//  
//
//  Created by zifei on 2021/2/24.
//

#import "Porson.h"

@implementation Porson

-(void)eat:(NSInteger )x{
    NSLog(@"计算");
}

-(void)eat1:(void(^)(int x))block{
 
    block(10);
}

-(void(^)(int y))eatFood:(int)x{
    return ^(int x){
        NSLog(@"eatFood = %d",x);
    };
}
-(int(^)(int y))eatFood3{
   
    return ^(int y){
        return 100;
    };
}

-(void(^)(int y))eatFood1:(void(^)(int x))block{
    
    return ^(int x){
        
        block(x);
    };
}

-(int(^)(int))eatfood2:(void(^)(int))blcok{

    blcok(20);
    return ^(int x){
        
        return 10;
    };
}
@end
