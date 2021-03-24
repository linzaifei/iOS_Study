//
//  SQLManager.h
//  SQLite
//
//  Created by zifei on 2021/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SQLManager : NSObject

+(instancetype)shareSqlManager;

/**
 创建一个数据库
 */
-(BOOL)openDatabase:(NSString *)name;

/**
 创建一个表单
 */
-(BOOL)createTabelSql:(NSString *)sql ;

/**
 插入数据
 */
-(BOOL)insertTabelInfo:(NSString *)sql;

/**
 查询数据
 */
-(id)queryTabelInfo:(NSString *)sql;


@end

NS_ASSUME_NONNULL_END
