//
//  Person.h
//  SQLite
//
//  Created by zifei on 2021/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSSecureCoding>
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) int age;

-(Person *)initWithName:(NSString*)name age:(int)age;
@end

NS_ASSUME_NONNULL_END
