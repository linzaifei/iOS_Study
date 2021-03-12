//
//  CalculatorMaker.m
//  Block用发
//
//  Created by zifei on 2021/2/24.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker

-(CalculatorMaker* (^)(int value))add{
    return ^(int value){
        self.result +=value;
        return self;
    };
}
@end
