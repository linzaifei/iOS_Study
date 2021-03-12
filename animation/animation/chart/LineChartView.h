//
//  LineChartView.h
//  animation
//
//  Created by zifei on 2021/2/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LineChartView : UIView
@property(nonatomic,strong)CAShapeLayer *chartLineShape;

-(void)startDraw;
@end

NS_ASSUME_NONNULL_END
