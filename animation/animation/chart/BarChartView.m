//
//  BarChartView.m
//  animation
//
//  Created by zifei on 2021/2/25.
//

#import "BarChartView.h"
@interface BarChartView()

@property(nonatomic,strong)CAShapeLayer *chartBarShape;
@property(nonatomic,strong)CABasicAnimation *animation;
@end

@implementation BarChartView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return  self;
}

-(void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    
    self.animation = [CABasicAnimation animation];
    self.chartBarShape = [CAShapeLayer layer];
    self.chartBarShape.lineCap = kCALineCapButt;
    self.chartBarShape.lineJoin = kCALineJoinRound;
    self.chartBarShape.fillColor = [UIColor whiteColor].CGColor;
    self.chartBarShape.lineWidth =30;
    self.chartBarShape.strokeEnd = 0;
    [self.layer addSublayer:self.chartBarShape];
    
}


- (void)startDraw{
    self.chartBarShape.strokeEnd = 1;
    [self.chartBarShape addAnimation:self.animation forKey:@""];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i=0; i<5; i++) {
        [path moveToPoint:CGPointMake(50*(i+1), 100)];
        [path addLineToPoint:CGPointMake(50*(i+1), 10)];
    }
    
    self.chartBarShape.path = path.CGPath;
    self.chartBarShape.strokeColor = [UIColor redColor].CGColor;
    self.animation.keyPath = @"strokeEnd";
    self.animation.fromValue = @0;
    self.animation.toValue = @1;
    self.animation.duration = 2;
    self.animation.autoreverses = NO;
    
}


@end
