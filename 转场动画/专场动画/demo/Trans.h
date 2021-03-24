//
//  Trans.h
//  专场动画
//
//  Created by zifei on 2021/3/16.
//

#import <UIKit/UIKit.h>

//
typedef int TransitionType NS_STRING_ENUM;

FOUNDATION_EXPORT TransitionType const TransitionTypePresent;
FOUNDATION_EXPORT TransitionType const TransitionTypeDismiss;

NS_ASSUME_NONNULL_BEGIN

@interface Trans : NSObject <UIViewControllerAnimatedTransitioning>

-(instancetype)initWithType:(TransitionType)type;

@end

NS_ASSUME_NONNULL_END
