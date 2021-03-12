//
//  Files.h
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Files : NSObject
///写入文件
+(BOOL)wirteFile:(NSString *)path data:(NSData *)data;
///读取文件
+(NSData *)getDataWithPath:(NSString *)path;


@end

NS_ASSUME_NONNULL_END
