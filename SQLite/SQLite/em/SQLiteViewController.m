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
    SQLManager *manger = [[SQLManager alloc] init];
    [manger openDatabase];
    
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
