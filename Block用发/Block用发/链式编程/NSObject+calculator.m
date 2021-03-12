//
//  NSObject+calculator.m
//  Block用发
//
//  Created by zifei on 2021/2/24.
//

#import "NSObject+calculator.h"

@implementation NSObject (calculator)

+(int)makerCalculaer:(void(^)(CalculatorMaker *maker))block{
    CalculatorMaker *mar = [[CalculatorMaker alloc] init];
    block(mar);
    return mar.result;
}

@end
