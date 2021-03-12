//
//  Transform3DController.m
//  animation
//
//  Created by zifei on 2021/3/8.
//

#import "Transform3DController.h"

@interface Transform3DController ()
//@property(nonatomic,strong)UIImageView *imagView;
@end

@implementation Transform3DController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 150, 100, 100)];
    self.imageView.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:self.imageView];
    
    
    

    
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
    [self  demo];
    

}
#pragma mark -- 平移
-(void)Translation{
    CATransform3D transform =CATransform3DMakeTranslation(0, 100, 0);
    [UIView  animateWithDuration:1 animations:^{
        self.imageView.layer.transform = transform;
    }];
}

#pragma mark -- 放大
-(void)Scale{
    CATransform3D transform =CATransform3DMakeScale(1.1, 1.1, 1);
    [UIView  animateWithDuration:1 animations:^{
        self.imageView.layer.transform = transform;
    }];
}

#pragma mark -- 旋转
-(void)Rotation{
    CATransform3D transform =CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    [UIView  animateWithDuration:1 animations:^{
        self.imageView.layer.transform = transform;
    }];
}

#pragma mark -- 叠加
-(void)Concat{
    CATransform3D transfrom = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D transfrom1 = CATransform3DMakeTranslation(100, 100, 0);
    [UIView  animateWithDuration:1 animations:^{
        self.imageView.layer.transform = CATransform3DConcat(transfrom, transfrom1);;
    }];
}

#pragma mark -- 反转 即放大等一缩小
-(void)Invert{
    CATransform3D transfrom = CATransform3DMakeScale(0.8, 0.5, 1);
   transfrom =  CATransform3DInvert(transfrom);
    [UIView  animateWithDuration:1 animations:^{
        self.imageView.layer.transform = transfrom;
    }];
}


#pragma mark -- demo
-(void)demo{
    
    UIImageView *fromView = [[UIImageView alloc] initWithFrame:self.imageView.bounds];
    fromView.image = [UIImage imageNamed:@"4"];
    [self.imageView addSubview:fromView];
    
    CATransform3D transform = CATransform3DIdentity;
    transform =  CATransform3DScale(transform, 0.5, 0.5, 1);
    transform =  CATransform3DInvert(transform);
    transform =  CATransform3DRotate(transform,M_PI, 0, 0, 1);
    self.imageView.layer.transform  = transform;
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.imageView.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.imageView.layer.transform  = CATransform3DMakeTranslation(0, 100, 0);
        }completion:^(BOOL finished) {
            fromView.layer.anchorPoint = CGPointMake(0.5, 0);
            fromView.frame= CGRectMake(fromView.frame.origin.x, fromView.frame.origin.y-50, fromView.frame.size.width, fromView.frame.size.height);
            
            [UIView animateWithDuration:1 animations:^{
                
                CATransform3D transform = CATransform3DIdentity;
                transform.m34 = -1/400.0;
                transform = CATransform3DRotate(transform, M_PI, 1, 0, 0);
                
                fromView.layer.transform =transform;
            
            }];
            
        }];
    }];

}

#pragma mark -- demo1
-(void)demo1{
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
