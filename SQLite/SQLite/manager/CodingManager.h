//
//  CodingManager.h
//  SQLite
//
//  Created by zifei on 2021/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CodingManager : NSObject

+(NSData *)archivedRootObject:(id)object secureCoding:(BOOL)secure;
+(NSArray *)unarchivedArrayOfObjectsOfClass:(Class)cls data:(NSData *)data;
+(id)unarchivedObjectOfClass:(Class)cls data:(NSData *)data;
@end

NS_ASSUME_NONNULL_END
