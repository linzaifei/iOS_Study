//
//  Person.m
//  SQLite
//
//  Created by zifei on 2021/3/11.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
-(Person *)initWithName:(NSString*)name age:(int)age{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

/**---------------归档-------------*/
//将对象转为二进制流，存储在磁盘中
//- (void)encodeWithCoder:(NSCoder *)coder{
//    [coder encodeObject:self.name forKey:@"name"];
//       [coder encodeObject:[NSString stringWithFormat:@"%d",self.age] forKey:@"age"];
//}
//从coder中读取数据，并返回相应的类型对象；即反序列化
//- (nullable instancetype)initWithCoder:(NSCoder *)coder{
//    if (self = [super init]) {
//        self.name = [coder decodeObjectForKey:@"name"];
//       self.age =  [[coder decodeObjectForKey:@"age"] intValue];
//    }
//    return self;
//}

/**---------------使用runtime 归档-------------*/

- (void)encodeWithCoder:(NSCoder *)coder{
    unsigned int count =0;
    
    Ivar *ivars =  class_copyIvarList([self class], &count);
    
    for (int i=0; i<count; i++) {
        const char * name = ivar_getName(ivars[i]);
        NSLog(@"%s",name);
        NSString *nName = [NSString stringWithUTF8String:name];
        [coder encodeObject:[self valueForKey:nName] forKey:nName];
    }
    
    free(ivars); //释放
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init]) {
        unsigned int count =0;
       Ivar *ivars = class_copyIvarList([self class], &count);
        
        for (int i=0; i<count; i++) {
            const char *name = ivar_getName(ivars[i]);
            NSString *keyName = [NSString stringWithUTF8String:name];
          id value =   [coder decodeObjectForKey:keyName];
            [self setValue:value forKey:keyName];
        }
        
        free(ivars);
    }
    return self;
}

// 这个需要返回YES
+(BOOL)supportsSecureCoding{
    return YES;
}
@end
