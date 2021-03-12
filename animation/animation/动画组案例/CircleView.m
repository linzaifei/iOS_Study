//
//  CircleView.m
//  animation
//
//  Created by zifei on 2021/2/24.
//

#import "CircleView.h"
@interface CircleView() <CAAnimationDelegate>

@end
@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circleLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGPoint centerPoint = CGPointMake(frame.size.width/2, frame.size.height/2);
        CGFloat radius =frame.size.width>frame.size.height?frame.size.height/2:frame.size.width/2;
        
        
        [path addArcWithCenter:centerPoint radius:radius startAngle:-M_PI_2 endAngle:M_PI*2 clockwise:YES];
        self.circleLayer .strokeColor = [UIColor redColor].CGColor;
        self.circleLayer .fillColor = [UIColor clearColor].CGColor;
        self.circleLayer.lineWidth = 2;
        self.circleLayer .path = path.CGPath;
        [self.layer addSublayer:self.circleLayer];
        
    }
    return self;
}

-(void)start{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"strokeEnd";
    animation.delegate = self;
    animation.duration =3;
    animation.fromValue = @0.0;
    animation.toValue= @1.0;
//    [animation setValue:@"storkeAnimation" forKey:@"group"];
    [self.circleLayer  addAnimation:animation forKey:@"storkeAnimation"];

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if([self.delegate respondsToSelector:@selector(circleAnimationStop)]){
        [self.delegate circleAnimationStop];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.



@end
