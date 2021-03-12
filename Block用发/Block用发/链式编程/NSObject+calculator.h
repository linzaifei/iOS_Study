//
//  NSObject+calculator.h
//  Block用发
//
//  Created by zifei on 2021/2/24.
//

#import <Foundation/Foundation.h>
#import "CalculatorMaker.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (calculator)

+(int)makerCalculaer:(void(^)(CalculatorMaker *maker))block;

@end

NS_ASSUME_NONNULL_END
