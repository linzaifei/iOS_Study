//
//  EmittrLayerController.m
//  animation
//
//  Created by zifei on 2021/2/18.
//

#import "EmittrLayerController.h"
#import "CloudView.h"
@interface EmittrLayerController ()
@property(nonatomic,strong)UIView *rainView;
@property(nonatomic,strong)UIView *snowView;
@property(nonatomic,strong)UIView *cloudView;
@end

@implementation EmittrLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self demo];
    
    
    CloudView *cloudView = [[CloudView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300)];
    
    [self.view addSubview:cloudView];
    
    
}

-(void)demo{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = self.view.bounds.size;
    [self.view addSubview:scrollView];
    
   
//    self.rainView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 300)];
//    [scrollView addSubview:self.rainView];
//
//    self.snowView = [[UIView alloc] initWithFrame:CGRectMake(0, 320, self.view.frame.size.width, 300)];
//    [scrollView addSubview:self.snowView];
    
    self.cloudView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 300)];
    self.cloudView.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:self.cloudView];
    
//    self.rainView.clipsToBounds = YES;
//    self.snowView.clipsToBounds = YES;
    self.cloudView.clipsToBounds = YES;
    
//    [self rain];
//    [self snow];
    [self cloud];
}


#pragma mark - rain
-(void)rain{
    CAEmitterLayer *layer = [CAEmitterLayer layer];

    //粒子形状
    layer.emitterShape = kCAEmitterLayerLine;
    //粒子发射模式
    layer.emitterMode = kCAEmitterLayerSurface;
    //发射源中心
    layer.emitterPosition = CGPointMake(self.rainView.bounds.size.width/2, -10);
    
    //发射源的size( 决定了发射源的大小，如果做了倾斜或者偏移屏幕宽度是不够的，那时候就需要自定义)
    layer.emitterSize = self.rainView.frame.size;
   
    //渲染模式
    layer.renderMode = kCAEmitterLayerAdditive;
    
    [self.rainView.layer addSublayer:layer];
    
    
    //2.设置粒子
    CAEmitterCell * cell = [CAEmitterCell emitterCell];
    cell.name = @"rain";
    //粒子的产生率
    cell.birthRate = 60.0f;
  
    //粒子生命周期 2s
    cell.lifetime = 40.0f;
//    cell.lifetimeRange = 25.0f;
    
    //粒子的经纬度夹角
//    cell.emissionLatitude = M_PI/6;
//    cell.emissionLongitude = 0;
    
    //发射角度
//    cell.emissionRange = 0.f;
    
   
    
    //发射速度
    cell.velocity = 20.0f;
    cell.velocityRange = 100.0f;
    
    //x y z 轴 加速度
    cell.yAcceleration = 200.0f;
//    cell.xAcceleration = -8.0f;
    
    //缩放比例
    cell.scale = 0.2;
//    //缩放范围
//    cell.scaleRange = 0.4;//下落放大速率 值越大 放的越大
//    //缩放速度
//    cell.scaleSpeed = 0.01; //下落放大速率 值越大 放的越大
    
    //粒子平均速度
//    cell.spin = .0f; //设置后下降和旋转速度加快
//    cell.spinRange = M_PI/3;//下落并且旋转角度
    
    
    // 粒子在三个色相中以及可见度的变化程度
//    cell.redRange = 10.f;
//    cell.greenRange = 20.f;
//    cell.blueRange = 30.f;
//
//    cell.redSpeed = 1.f;
//    cell.greenSpeed = 1.f;
//    cell.blueSpeed = 1.f;
//
//    cell.alphaRange = 0.8;
//    cell.alphaSpeed = -0.1f;
    

  
    
    cell.contents =  (id)[UIImage imageNamed:@"rain1"].CGImage;
    
    layer.emitterCells = @[cell];
    
    
}
#pragma mark - snow

-(void)snow{
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
//    emitterLayer.frame = self.view.bounds;
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    emitterLayer.emitterMode = kCAEmitterLayerVolume;
    // 发射源的size 决定了发射源的大小，如果做了倾斜或者便宜屏幕宽度是不够的，那时候就需要自定义
     emitterLayer.emitterSize = self.view.frame.size;
     // 发射源的位置
     emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, -10);
     // 渲染模式 枚举类型 （⭐️这个渲染模式表达效果会很不好，不常用，kCAEmitterLayerAdditive，可以让重叠的部分高亮）
     emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    CAEmitterCell * showCell = [CAEmitterCell emitterCell];
       
    // 2. 设置属性
       showCell.contents = (id)[[UIImage imageNamed:@"xin"] CGImage];  // 粒子的内容 是CGImageRef类型的
       
       // 粒子的产生率
       showCell.birthRate = 25.f;
       // 粒子的生命周期,以秒为单位。
       showCell.lifetime = 100.f;
       // 粒子的生命周期的范围，以秒为单位。默认0
       showCell.lifetimeRange = 25.f;
       // 速度，制约粒子生命周期
       // 官方解释为：指定时间如何从父时间空间映射到接收者的时间空间。「必需的」
       // 值越大粒子消失的越快
       showCell.speed = 2.f;
       
       // 速度
       showCell.velocity = 20.f;
       // 速度范围
       showCell.velocityRange = 100.f;
       // 三轴加速度（一般使用Y值）
       showCell.yAcceleration = 90.f;
//           showCell.xAcceleration = 20.f;
//           showCell.zAcceleration = 10.f;
       
       // 缩放比列
       showCell.scale = 0.3;
       // 缩放范围
       showCell.scaleRange = 0.5;
       // 在粒子的生命周期内尺度变化的速度。可以做成动画。
       showCell.scaleSpeed = 0.02;
       
       // 设置经纬度（方向）（⭐️⭐️需要在 kCAEmitterLayerPoint 的情况下搭配使用）
       //    showCell.emissionLongitude = M_PI; // 上(-M_PI_2) 下(M_PI_2) 左(M_PI) 右(M_PI_4) 通常使用这个
       //    // showCell.emissionLatitude = -M_PI_2; // 前(-M_PI_2) 后(M_PI_2) 左(M_PI) 右(M_PI_4)
       //    // 设置角度,控制发射范围（受到经纬度的影响）
       //    showCell.emissionRange = M_PI / 6; // 围绕X轴向左90度
       
       // 设置自转速度
       showCell.spin = 0.f;
       // 设置自转方向
       showCell.spinRange = M_PI;
       
       // 设置颜色（⭐️⭐️直接影响到图片的原有颜色）
       //    snowCell.color = [[UIColor colorWithRed:0.5 green:0.f blue:0.5 alpha:1.f] CGColor];
       // 粒子在三个色相中以及可见度的变化程度
       showCell.redRange = 10.f;
       showCell.greenRange = 20.f;
       showCell.blueRange = 30.f;
       
       showCell.redSpeed = 1.f;
       showCell.greenSpeed = 1.f;
       showCell.blueSpeed = 1.f;
       
       showCell.alphaRange = 0.8;
       showCell.alphaSpeed = -0.1f;
       
    // 3.粒子添加到CAEmitterLayer上
       emitterLayer.emitterCells = @[showCell];
    
    [self.snowView.layer addSublayer:emitterLayer];
}

#pragma mark - cloud
-(void)cloud{
    
    CAEmitterLayer *layer = [CAEmitterLayer layer];
    
    layer.emitterPosition = CGPointMake(0,self.cloudView.frame.size.height*0.5);
    
    layer.emitterSize = self.cloudView.frame.size;
    
    layer.emitterShape = kCAEmitterLayerRectangle;
    layer.emitterMode = kCAEmitterLayerSurface;
    layer.renderMode = kCAEmitterLayerAdditive;
    
    
//    layer.velocity = 10.f;
    
//    layer.scale = 0.3;
    
//    layer.spin = 1.f;
    
//    layer.seed = 1;
                   
    [self.cloudView.layer addSublayer:layer];
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    cell.birthRate = 4.f;
    cell.lifetime = 50.f;
    cell.lifetimeRange = 50;
    cell.xAcceleration = 100.f;
    
    cell.velocity = 10;
    cell.velocityRange = 40;
    
    cell.scale = 0.8;
    cell.scaleRange = 0.4;
    cell.scaleSpeed = 0.01;
    
    cell.contents = (id)[UIImage imageNamed:@"yun"].CGImage;
    
    layer.emitterCells = @[cell];
    
    
}


@end
