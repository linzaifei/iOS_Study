//
//  CodingViewController.m
//  SQLite
//
//  Created by zifei on 2021/3/11.
//

#import "CodingViewController.h"
#import "Person.h"
#import "CodingManager.h"
#import "Util.h"
#import "Files.h"
@interface CodingViewController ()

@end

@implementation CodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *p = [[Person alloc] initWithName:@"张三" age:12];
    Person *p1 = [[Person alloc] initWithName:@"张si" age:14];
    NSArray *arr = [NSArray arrayWithObjects:p,p1, nil];
    NSLog(@"%@",p.name);
    
    //序列化数据
    NSData *perData = [CodingManager archivedRootObject:arr secureCoding:YES];
    NSLog(@"data = %@",perData);
    
    ///保存数据
    
    NSString *file= [[Util getDoucmentPath] stringByAppendingPathComponent:@"person.modal"];
    BOOL b =    [Files wirteFile:file data:perData];
    
    if (b) {
        ///根据路劲获取data数据
        NSData * d = [Files getDataWithPath:file];
        
        
        ///反序列化
        id reslut =  [CodingManager unarchivedArrayOfObjectsOfClass:[Person class] data:d];
        
        //    Person *reslut = (Person *) [NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:perData error:&error];
        
        NSLog(@"data = %@",reslut);
    }
    
    
    
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
