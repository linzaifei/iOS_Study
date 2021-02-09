//
//  RedView.m
//  DrawReact
//
//  Created by zifei on 2021/2/7.
//

#import "RedView.h"

@implementation RedView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//
//    [self draw10];
//}
//绘制
-(void)draw{
    //kCGLineCapButt, kCGLineCapRound, kCGLineCapSquare

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 40)];
    [bezierPath addLineToPoint:CGPointMake(200, 40)];
    bezierPath.lineWidth = 20;
    bezierPath.lineCapStyle =kCGLineCapButt;
    [[UIColor orangeColor] setStroke];
    [bezierPath stroke];
    
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    [bezierPath1 moveToPoint:CGPointMake(20, 140)];
    [bezierPath1 addLineToPoint:CGPointMake(200, 140)];
    bezierPath1.lineWidth = 20;
    bezierPath1.lineCapStyle =kCGLineCapRound;
    [[UIColor orangeColor] setStroke];
    [bezierPath1 stroke];
    
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPath];
    [bezierPath2 moveToPoint:CGPointMake(20, 240)];
    [bezierPath2 addLineToPoint:CGPointMake(200, 240)];
    bezierPath2.lineWidth = 20;
    bezierPath2.lineCapStyle =kCGLineCapSquare;
    [[UIColor orangeColor] setStroke];
    [bezierPath2 stroke];
}

//绘制
-(void)draw1{
    //kCGLineJoinMiter,kCGLineJoinRound, kCGLineJoinBevel
    
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 40)];
    [bezierPath addLineToPoint:CGPointMake(200, 40)];
    [bezierPath addLineToPoint:CGPointMake(200, 60)];
    bezierPath.lineWidth = 20;
    bezierPath.lineJoinStyle =kCGLineJoinMiter;
    [[UIColor orangeColor] setStroke];
    [bezierPath stroke];

    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    [bezierPath1 moveToPoint:CGPointMake(20, 140)];
    [bezierPath1 addLineToPoint:CGPointMake(200, 140)];
    [bezierPath1 addLineToPoint:CGPointMake(200,160)];
    bezierPath1.lineWidth = 20;
    bezierPath1.lineJoinStyle =kCGLineJoinRound;
    [[UIColor orangeColor] setStroke];
    [bezierPath1 stroke];
    
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPath];
    [bezierPath2 moveToPoint:CGPointMake(20, 240)];
    [bezierPath2 addLineToPoint:CGPointMake(200, 240)];
    [bezierPath2 addLineToPoint:CGPointMake(200, 260)];
    bezierPath2.lineWidth = 20;
    bezierPath2.lineJoinStyle =kCGLineJoinBevel;
    [[UIColor orangeColor] setStroke];
    [bezierPath2 stroke];
}


-(void)draw2{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 120, 120) cornerRadius:20];
    bezierPath.lineWidth = 10;
    [[UIColor orangeColor] setStroke];
    [bezierPath stroke];
}

-(void)draw3{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 120, 120) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(30, 0)];
    [[UIColor orangeColor] setFill];
    [bezierPath closePath];
    [bezierPath fill];
}
//绘制圆弧
-(void)draw4{
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50 startAngle:0 endAngle:M_PI*0.5 clockwise:YES];
    
    bezierPath.lineWidth = 10;
    
    [[UIColor orangeColor] setStroke];
//    [bezierPath closePath];
    [bezierPath stroke];
}

//绘制圆弧
-(void)draw5{
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRoundedRect(path, NULL, CGRectMake(10, 10, 150, 150), 20, 20);
    
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithCGPath:path];
    
    bezierPath.lineWidth = 10;
    
    [[UIColor orangeColor] setStroke];
//    [bezierPath closePath];
    [bezierPath stroke];
}

//三次贝塞尔曲线
-(void)draw6{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 100)];
    [bezierPath addCurveToPoint:CGPointMake(280, 130) controlPoint1:CGPointMake(100, 20) controlPoint2:CGPointMake(160, 200)];
    bezierPath.lineWidth = 10;
    
    [[UIColor orangeColor] setStroke];
    [bezierPath stroke];
}

//二次贝塞尔曲线
-(void)draw7{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 100)];
    [bezierPath addQuadCurveToPoint:CGPointMake(240, 100) controlPoint:CGPointMake(140, 20)];
    bezierPath.lineWidth = 10;
    
    [[UIColor orangeColor] setStroke];
    [bezierPath stroke];
}



//追加路劲
-(void)draw8{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 100)];
    [bezierPath addQuadCurveToPoint:CGPointMake(240, 100) controlPoint:CGPointMake(140, 20)];
    bezierPath.lineWidth = 10;
    
    [[UIColor orangeColor] setStroke];
    [bezierPath stroke];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(200, 200) radius:50 startAngle:0 endAngle:M_PI clockwise:NO];
    path.lineWidth=10;
    [[ UIColor greenColor] setStroke];
    [path stroke];

    [bezierPath appendPath:path];
    

}


//bezierPathByReversingPath 扭转路径，即起点变成终点，终点变成起点：
-(void)draw9{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 30)];
    [bezierPath addLineToPoint:CGPointMake(200, 30)];
    [bezierPath addLineToPoint:CGPointMake(200, 80)];
    bezierPath.lineWidth = 10;
    
    //交换
    bezierPath = [bezierPath bezierPathByReversingPath];
    
    [bezierPath stroke];
    
}

// - (void)applyTransform:(CGAffineTransform)transform
-(void)draw10{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 30)];
    [bezierPath addLineToPoint:CGPointMake(200, 30)];
    [bezierPath addLineToPoint:CGPointMake(200, 80)];
    bezierPath.lineWidth = 10;
    [bezierPath closePath];
    [bezierPath stroke];
    
    
//    CGAffineTransform from = CGAffineTransformIdentity;
//    CGAffineTransformScale(from, 1.3, 3);
//    CGAffineTransformRotate(from,M_PI/2);
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI*0.25);
    [bezierPath applyTransform:transform];
    
    
    

}

@end
