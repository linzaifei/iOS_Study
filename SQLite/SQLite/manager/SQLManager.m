//
//  SQLManager.m
//  SQLite
//
//  Created by zifei on 2021/3/11.
//

#import "SQLManager.h"
#import <sqlite3.h>
#import "Util.h"
@interface SQLManager ()
{
    sqlite3 *_db;
}
@end
@implementation SQLManager

-(void)openDatabase{
    NSString *path = [Util getDoucmentPath];
  
    //1. 拼接一个path
    NSString *fileName = [path stringByAppendingPathComponent:@"student.sqlite"];
    
    
    NSLog(@"%@",fileName);
    
    // 将 OC 字符串转换为 C 语言的字符串
    const char * file =  fileName.UTF8String;
    
    int reslut = sqlite3_open(file, &_db);
    
    if (reslut !=SQLITE_OK) {
        NSLog(@"打开失败");
        
        return;
        
    }
    NSLog(@"打开成功");
    
    
    

    
}



@end
