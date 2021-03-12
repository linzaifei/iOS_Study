//
//  SQLManager.m
//  SQLite
//
//  Created by zifei on 2021/3/11.
//
#import <sqlite3.h>
#import "SQLManager.h"

#import "Util.h"
@interface SQLManager ()
{
    sqlite3 *_db;
}
@end
@implementation SQLManager
/**
 创建一个数据库
 */
-(BOOL)openDatabase:(NSString *)name{
    NSString *path = [Util getDoucmentPath];
    //1. 拼接一个path
    NSString *fileName = [path stringByAppendingPathComponent: name];
    
    NSLog(@"%@",fileName);
    // 将 OC 字符串转换为 C 语言的字符串
    const char * file =  fileName.UTF8String;
    int reslut = sqlite3_open(file, &_db);
    if (reslut !=SQLITE_OK) {
        NSLog(@"打开失败");
        return NO;
    }
    NSLog(@"打开成功");
    return YES;
}
/**
 创建一个表单
 */
-(BOOL)createTabelSql:(NSString *)sql {
    char *err;
    int reslut =  sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &err);
    
    if (reslut !=SQLITE_OK) {
        NSLog(@"创建表失败");
        printf("创表失败---%s----%s---%d",err,__FILE__,__LINE__);
    }
    NSLog(@"创建表单成功");
    return YES;
}

/**
 插入数据
 */
-(BOOL)insertTabelInfo:(NSString *)sql{
    char *error;
    int reslut = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error);
    
    if (reslut !=SQLITE_OK) {
        NSLog(@"插入数据失败");
        return NO;
    }
    NSLog(@"插入数据成功");
    return YES;
}

/**
 查询数据
 */
-(id)queryTabelInfo:(NSString *)sql{
    
    sqlite3_prepare_v2(<#sqlite3 *db#>, <#const char *zSql#>, <#int nByte#>, <#sqlite3_stmt **ppStmt#>, <#const char **pzTail#>)
    
//    sqlite3_free(<#void *#>)
}

@end
