//
//  UIView+category.m
//  DrawReact
//
//  Created by zifei on 2021/2/7.
//

#import "UIView+category.h"

@implementation UIView (category)

-(void)addRadius:(CGFloat)radius WithDirection:(UIRectCorner)reactCorner{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:reactCorner cornerRadii:CGSizeMake(radius, radius)];
    
    [bezierPath fill];

    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = bezierPath.CGPath;
    
//    CALayer
    
    self.layer.mask = shapeLayer;

}

@end
