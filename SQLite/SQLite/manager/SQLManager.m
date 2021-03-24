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
static SQLManager *manager =nil;
@implementation SQLManager

+(instancetype)shareSqlManager{
    static dispatch_once_t instance;
    dispatch_once(&instance, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

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
        sqlite3_close(_db);
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
        sqlite3_close(_db);//关闭数据库
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
        sqlite3_close(_db);
        NSLog(@"插入数据失败");
        return NO;
    }
    NSLog(@"插入数据成功");
    return YES;
}

/**
 查询数据
 
  1.使用sqlite3_prepare_v2函数预处理SQL语句
  2.使用sqlite3_bind_text函数绑定参数
  3.使用sqlite3_step函数执行SQL语句，遍历结果集
  4.使用sqlite3_column_text等函数提取字段数据
  
 */
-(id)queryTabelInfo:(NSString *)sql{
    
    /*
     第一个参数：数据库对象
     第二个参数：SQL语句
     第三个参数：执行语句的长度 -1是指全部长度
     第四个参数：语句对象
     第五个参数：没有执行的语句部分 NULL
     */
    sqlite3_stmt * stmt;//语句对象
    int reslut = sqlite3_prepare_v2(_db, sql.UTF8String, -1, &stmt, NULL);
    if (reslut ==SQLITE_OK) {
        // 每调用一次sqlite3_step函数，stmt就会指向下一条记录
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            // 取出数据
            int ID =  sqlite3_column_int(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);   // 取出第1列字段的值
            int age  = sqlite3_column_int(stmt, 2);
            printf("%d %s %d\n",ID,name,age);
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);
    }
    
    return 0;;
}

@end
