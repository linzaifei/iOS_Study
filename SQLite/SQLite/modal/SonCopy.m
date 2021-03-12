//
//  Son.m
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import "SonCopy.h"
@interface SonCopy()
@property(nonatomic,copy)NSString *old;
@end

@implementation SonCopy
//
- (id)copyWithZone:(nullable NSZone *)zone{
    SonCopy *son = [[[self class] allocWithZone:zone] init];
    son.age = self.age;
    son.name=self.name;
    //未公开的
    son->_old = _old;
    
    return son;
}
@end
