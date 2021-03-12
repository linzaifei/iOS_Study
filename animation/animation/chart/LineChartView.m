//
//  LineChartView.m
//  animation
//
//  Created by zifei on 2021/2/25.
//

#import "LineChartView.h"
@interface LineChartView()
@property(nonatomic,strong)CABasicAnimation *animation;
@end
@implementation LineChartView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    
    self.animation = [CABasicAnimation animation];
    
    self.chartLineShape = [CAShapeLayer layer];
    self.chartLineShape.lineCap = kCALineCapRound;
    self.chartLineShape.lineJoin = kCALineJoinRound;
    self.chartLineShape.fillColor = [UIColor whiteColor].CGColor;
    self.chartLineShape.lineWidth =10;
    self.chartLineShape.strokeEnd = 0;
    
    [self.layer addSublayer:self.chartLineShape];
    
   
}
- (void)startDraw{
    self.chartLineShape.strokeEnd = 1;
    [self.chartLineShape addAnimation:self.animation forKey:@""];
} 


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(20, 30)];
    [ path addLineToPoint:CGPointMake(40, 50)];
    [ path addLineToPoint:CGPointMake(60, 30)];
    [ path addLineToPoint:CGPointMake(80, 60)];
    
    self.chartLineShape.path = path.CGPath;
    self.chartLineShape.strokeColor = [UIColor redColor].CGColor;
    self.animation.keyPath = @"strokeEnd";
    self.animation.fromValue = @0;
    self.animation.toValue = @1;
    self.animation.duration = 2;
    self.animation.autoreverses = NO;
    
}


@end
