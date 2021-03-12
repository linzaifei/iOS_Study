//
//  CalculatorMaker.h
//  Block用发
//
//  Created by zifei on 2021/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorMaker : NSObject

@property(nonatomic,assign)int result;

-(CalculatorMaker* (^)(int value))add;


@end

NS_ASSUME_NONNULL_END
