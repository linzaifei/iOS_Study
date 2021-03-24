//
//  SQLiteViewController.m
//  SQLite
//
//  Created by zifei on 2021/3/11.
//

#import "SQLiteViewController.h"
#import "SQLManager.h"
@interface SQLiteViewController ()

@end

@implementation SQLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SQLManager *manger = [SQLManager shareSqlManager];
    int reslut =  [manger openDatabase:@"db_student.sqlite"];
//
//
//    NSString *sql =@"CREATE TABLE IF NOT EXISTS t_students (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer NOT NULL);";
//
//    if(reslut){
//      int res =  [manger createTabelSql:sql];
//        //创建表成功
//        if (res) {
//
//            for (int i = 0; i < 20; i++) {
//                  NSString *name = [NSString stringWithFormat:@"韩雪--%d",arc4random_uniform(100)];
//                  int age = arc4random_uniform(20) + 10;
//                  // 拼接 sql 语句
//                  NSString *sql1 = [NSString stringWithFormat:@"INSERT INTO t_students (name,age) VALUES ('%@',%d);",name,age];
//                if ([manger insertTabelInfo:sql1]) {
//
//                }else{
//
//                }
//              }
//
//        }
//    }
    
    NSString *sql1 = @"SELECT * from t_students WHERE age<20;";
    
    [manger queryTabelInfo:sql1];
    
    
    
    
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
