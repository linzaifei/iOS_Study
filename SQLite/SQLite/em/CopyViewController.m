//
//  CopyViewController.m
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import "CopyViewController.h"

@interface CopyViewController ()

@end

@implementation CopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    /**
     向不可变对象发送copy，进行的是指针拷贝；向不可变对象发送mutalbeCopy消息，进行的是内容拷贝；
     */
    NSString *str =@"111";
    NSString *str1 = [str copy];
    NSMutableString *str2 = [str mutableCopy];
    NSLog(@"str=%p str1=%p str2=%p",str,str1,str2);
    
    NSMutableString *str3 = [NSMutableString stringWithString:@"2222"];
    NSString *str4 = [str3 copy];
    NSMutableString *str5= [str3 mutableCopy];
    NSLog(@"str3=%p str4=%p str5=%p",str3,str4,str5);
    
    
    
    
    
    
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
