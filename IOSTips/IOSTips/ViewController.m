//
//  ViewController.m
//  IOSTips
//
//  Created by zifei on 2021/3/22.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ZFAVCaptureSession.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//
//    ZFAVCaptureSession *session = [ZFAVCaptureSession shareCaptureSesstion];
//
//    UIView *perview = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 500)];
//    [self.view addSubview:perview];
//    session.preview = perview;
//
//    [session startRunning];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"xiangji"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(200, 450, 50, 50);
    [perview addSubview:btn];
    [btn addTarget:self action:@selector(onclick) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)onclick{
    
//    [[ZFAVCaptureSession shareCaptureSesstion] switchsCamera:AVCaptureDevicePositionFront];
    
}
/**
 canSetSessionPreset  检查是否支持指定分辨率
 
 */

@end
