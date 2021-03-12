//
//  Util.h
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject


+(NSString *)getDoucmentPath;

+(NSArray<NSString *> *)getPath:(NSSearchPathDirectory) directory;
@end

NS_ASSUME_NONNULL_END
