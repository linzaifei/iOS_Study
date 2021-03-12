//
//  Porson.h
//  
//
//  Created by zifei on 2021/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Porson : NSObject

-(void)eat:(NSInteger )x;

-(void)eat1:(void(^)(int x))block;

-(void(^)(int y))eatFood:(int)x;

-(int(^)(int y))eatFood3;

-(void(^)(int y))eatFood1:(void(^)(int x))block;

-(int(^)(int))eatfood2:(void(^)(int))blcok;
@end

NS_ASSUME_NONNULL_END
