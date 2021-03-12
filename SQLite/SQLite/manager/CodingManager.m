//
//  CodingManager.m
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import "CodingManager.h"

@implementation CodingManager

+ (NSData *)archivedRootObject:(id)object secureCoding:(BOOL)secure{
    NSError *error;
  NSData *data=  [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:&error];
    if(error){
        [NSException exceptionWithName:@"序列化错误" reason:@"错误了" userInfo:nil];
    }
    return data;
}

+(NSArray *)unarchivedArrayOfObjectsOfClass:(Class)cls data:(NSData *)data{
    NSError *error;
    NSArray *arr =  [NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:cls fromData:data error:&error];
    if(error){
        [NSException exceptionWithName:@"反序列化错误" reason:@"错误了" userInfo:nil];
    }
    return arr;
}
+(id)unarchivedObjectOfClass:(Class)cls data:(NSData *)data{
    NSError *error;
    id reslut =  [NSKeyedUnarchiver unarchivedObjectOfClass:cls fromData:data error:&error];
    if(error){
        [NSException exceptionWithName:@"反序列化错误" reason:@"错误了" userInfo:nil];
    }
    return reslut;
}
@end
