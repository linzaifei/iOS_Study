//
//  CalculatorManager.h
//  Block用发
//
//  Created by zifei on 2021/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorManager : NSObject

@property(nonatomic,assign)int reslut;

-(instancetype)calculator:(int(^)(int x))block;

@end

NS_ASSUME_NONNULL_END
