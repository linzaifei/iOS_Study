//
//  MotionView.m
//  animation
//
//  Created by zifei on 2021/3/8.
//

#import "MotionView.h"
#import <CoreMotion/CoreMotion.h>
@interface MotionView()
@property(nonatomic,strong)CMMotionManager *motionManager;
@end
@implementation MotionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setMotion];
    }
    return self;
}

-(void)setMotion{
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    self.motionManager.deviceMotionUpdateInterval = 0.01;
    
    [self.motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXMagneticNorthZVertical toQueue:[[NSOperationQueue alloc] init] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            CGFloat x = motion.gravity.x;
             CGFloat y = motion.gravity.y;
             CGFloat z = motion.gravity.z;
            
            NSLog(@"x=%f, y=%f, z= %f",x,y,z);
            
            
            
            
            self.layer.transform = [self transformWithM34:1.0 / -500 xf:x yf:y];
            self.layer.transform = [self transformWithM34:1.0 / -250 xf:x yf:y];
            
        }];
        
    }];
}
-(CATransform3D)transformWithM34:(CGFloat)m34 xf:(CGFloat)xf yf:(CGFloat)yf {
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 = m34;
    t = CATransform3DRotate(t, M_PI / 9 * yf, -1, 0, 0);
    t = CATransform3DRotate(t, M_PI / 9 * xf, 0, 1, 0);
    return t;
    
}



@end
