//
//  CopyViewController.m
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import "CopyViewController.h"
#import "SonCopy.h"
@interface CopyViewController ()

@end

@implementation CopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    SonCopy *s = [[SonCopy alloc] init];
    
    s.age = 12;
    s.name =@"zhangsan";
    
    NSLog(@"%d %@",s.age,s.name);
    
    SonCopy *m = [s copy] ;
    m.age = 14;
    m.name = @"sd";
    NSLog(@"%d %@ ,%d %@",m.age,m.name,s.age,s.name);
    
    
}

#pragma mark ---- 字符串 数组拷贝(都是浅拷贝)
-(void)project{
    
    /**
     向不可变对象发送copy，进行的是指针拷贝；向不可变对象发送mutalbeCopy消息，进行的是内容拷贝；
     */
    NSString *str =@"111";
    NSString *str1 = [str copy];
    NSMutableString *str2 = [str mutableCopy];
    NSLog(@"str=%p str1=%p str2=%p",str,str1,str2);
    str2 = [NSMutableString stringWithString: @"333"];
    str1 = @"2222";
    NSLog(@"str=%@ str1=%@ str2=%@",str,str1,str2);
    
    
   
    ///向可变对象发送copy和mutableCopy消息，均是深拷贝，也就是说内容拷贝；
    NSMutableString *str3 = [NSMutableString stringWithString:@"2222"];
    NSString *str4 = [str3 copy];
    NSMutableString *str5= [str3 mutableCopy];
    NSLog(@"str3=%p str4=%p str5=%p",str3,str4,str5);
    
    
    /**
     不可变对象copy，是浅拷贝，也就是说指针复制；发送mutableCopy，是深复制，也就是说内容复制;
     */
    NSArray *array = [NSArray arrayWithObjects:@"1", nil];
    NSArray *copyArray = [array copy];
    NSMutableArray *mutableCopyArray = [array mutableCopy];
    [mutableCopyArray addObject:@2];
    NSLog(@"array is %p,  copyArray is %p,  mutableCopyArray is %p", array, copyArray, mutableCopyArray);
    
   
    /**
     可变对象copy和mutableCopy均是单层深拷贝，也就是说单层的内容拷贝；
     只能拷贝一层
     */
    
    NSMutableArray *element = [NSMutableArray arrayWithObject:@1];
    NSMutableArray *array1 = [NSMutableArray arrayWithObject:element];
    NSArray *copyArray1 = [array1 copy];
    NSMutableArray *mutableCopyArray1 = [array1 mutableCopy];
    NSLog(@"array is %p,  copyArray is %p,  mutableCopyArray is %p", array1, copyArray1, mutableCopyArray1);
    [mutableCopyArray1[0] addObject:@2];
    NSLog(@"element is %@,  array is %@,  copyArray is %@,  mutableCopyArray is %@", element,array1,copyArray1, mutableCopyArray1);
       
//    NSMutableArray *a = [[NSMutableArray alloc] initWithArray:array1 copyItems:YES];
//    [a[0] addObject:@3];
//
//    NSLog(@"%@",a);
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
