//
//  CalculatorManager.m
//  Block用发
//
//  Created by zifei on 2021/2/24.
//

#import "CalculatorManager.h"

@implementation CalculatorManager

-(instancetype)calculator:(int(^)(int x))block{
    
    _reslut = block(_reslut);
    return self;
}
@end
