//
//  CircleView.h
//  animation
//
//  Created by zifei on 2021/2/24.
//

#import <UIKit/UIKit.h>

@protocol CircleDelegate <NSObject>

-(void)circleAnimationStop;

@end
NS_ASSUME_NONNULL_BEGIN

@interface CircleView : UIView
@property(nonatomic,strong) CAShapeLayer *circleLayer;
@property(nonatomic,weak)id<CircleDelegate> delegate;
-(void)start;
@end

NS_ASSUME_NONNULL_END
