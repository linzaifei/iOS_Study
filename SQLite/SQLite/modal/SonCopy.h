//
//  SonCopy.h
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SonCopy : NSObject <NSCopying>

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) int age;

@end

NS_ASSUME_NONNULL_END
