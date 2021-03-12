//
//  Util.m
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import "Util.h"

@implementation Util

+(NSString *)getDoucmentPath{
    return [[self getPath:NSDocumentDirectory] firstObject];
}

+(NSArray<NSString *> *)getPath:(NSSearchPathDirectory) directory;{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
}
@end
