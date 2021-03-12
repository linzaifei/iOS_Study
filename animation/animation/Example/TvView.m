//
//  TvView.m
//  animation
//
//  Created by zifei on 2021/3/8.
//

#import "TvView.h"

@implementation TvView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addPan];
    }
    return self;
}

-(void)addPan{
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(5,5);
    self.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    self.layer.shadowRadius = 4;//阴影半径，默认3

    
 
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self  addGestureRecognizer:pan];
    
}

-(void)pan:(UIPanGestureRecognizer*)panGes{
    CGPoint touchPoint = [panGes locationInView:self];
    
    if (panGes.state == UIGestureRecognizerStateChanged) {
        CGFloat xFactor = MIN(1, MAX(-1, (touchPoint.x - (self.bounds.size.width / 2)) / (self.bounds.size.width / 2)));
        CGFloat yFactor = MIN(1, MAX(-1, (touchPoint.y - (self.bounds.size.height / 2)) / (self.bounds.size.height / 2)));
        
        self.layer.transform = [self transformWithM34:1.0 / -500 xf:xFactor yf:yFactor];
        self.layer.transform = [self transformWithM34:1.0 / -250 xf:xFactor yf:yFactor];
        
        CGFloat zFactor = 180 * atan(yFactor / xFactor) / M_PI + 90;
        NSLog(@"%f", zFactor);
    } else if (panGes.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.3 animations:^{
            self.layer.transform = CATransform3DIdentity;
        
        } completion:NULL];
    }
}
-(CATransform3D)transformWithM34:(CGFloat)m34 xf:(CGFloat)xf yf:(CGFloat)yf {
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 = m34;
    t = CATransform3DRotate(t, M_PI / 9 * yf, -1, 0, 0);
    t = CATransform3DRotate(t, M_PI / 9 * xf, 0, 1, 0);
    return t;
    
}
@end
