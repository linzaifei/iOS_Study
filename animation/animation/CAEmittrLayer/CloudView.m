//
//  CloudView.m
//  weather
//
//  Created by zifei on 2021/2/25.
//

#import "CloudView.h"
@interface CloudView()
@property(nonatomic,strong)CAEmitterLayer *emlayer ;


@end
@implementation CloudView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self cloud];
    }
    return self;
}

-(void)cloud{
    
    self.emlayer = [CAEmitterLayer layer];

    
    self.emlayer.emitterShape = kCAEmitterLayerRectangle;
    self.emlayer.emitterMode = kCAEmitterLayerSurface;
    self.emlayer.renderMode = kCAEmitterLayerAdditive;
    
    [self.layer addSublayer:self.emlayer];
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    cell.birthRate = 3.f;
    cell.lifetime = 50.f;
    cell.lifetimeRange = 50.f;
    cell.xAcceleration = 100.f;
    
    cell.velocity = 10;
    cell.velocityRange = 40;
    
    cell.scale = 0.8;
    cell.scaleRange = 0.4;
    cell.scaleSpeed = 0.01;
    
    cell.contents = (id)[UIImage imageNamed:@"yun"].CGImage;
    
    self.emlayer.emitterCells = @[cell];
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.emlayer.emitterPosition = CGPointMake(0,rect.size.height*0.5);
    self.emlayer.emitterSize =rect.size;
}

//-(void)drawImage{
//
//    UIGraphicsBeginImageContext(CGSizeMake(80, 40));
//
//    CGContextRef ctx =  UIGraphicsGetCurrentContext();
//
//    CGContextAddArc(ctx, <#CGFloat x#>, <#CGFloat y#>, <#CGFloat radius#>, <#CGFloat startAngle#>, <#CGFloat endAngle#>, <#int clockwise#>)
//
//
//
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//
//
//}

@end
