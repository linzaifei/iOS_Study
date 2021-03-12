//
//  UIImage+category.h
//  Runtime
//
//  Created by zifei on 2021/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (category)
//Runtime(交换方法)
+(instancetype)imageViewName:(NSString *)name;



//动态添加属性
@property(nonatomic,copy)NSString *name;

@end

NS_ASSUME_NONNULL_END
