//
//  Files.m
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import "Files.h"

@implementation Files

+(BOOL)wirteFile:(NSString *)path data:(NSData *)data{
    return [data writeToFile:path atomically:YES];
}
+(NSData *)getDataWithPath:(NSString *)path{
    NSError *error;
   NSData *data = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedAlways error:&error];
    if(error){
        [NSException exceptionWithName:@"获取文件错误" reason:@"错误了" userInfo:nil];
    }
    return  data;
}
@end
