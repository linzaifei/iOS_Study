//
//  ZFAVCaptureSession.h
//  IOSTips
//
//  Created by zifei on 2021/3/23.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class ZFAVCaptureSession;
@protocol ZFAVCaptureSessionDelegate <NSObject>

- (void)captureVideoSession:(ZFAVCaptureSession*)session didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;
- (void)captureAudioSession:(ZFAVCaptureSession*)session didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;

@end
@interface ZFAVCaptureSession : NSObject

//+(instancetype)shareCaptureSesstion;
///捕捉绘画
@property(nonatomic,strong,nonnull)AVCaptureSession *session;
///视频重力 videoGravity
@property(nonatomic,copy) AVLayerVideoGravity videoGravity;
/// 摄像头方向  默认后置摄像头
@property (nonatomic, assign, readonly) AVCaptureDevicePosition devicePosition;
/// 摄像头采集内容预览视图
@property (nonatomic, strong, nullable) UIView *preview;
/// 是否正在采集运行
@property (nonatomic, assign, readonly) BOOL isRunning;
/// 闪光灯状态  默认是关闭的
//@property (nonatomic, assign) AVCaptureFlashMode flashMode;
/// 当前焦距    默认最小值1  最大值6
@property (nonatomic, assign) CGFloat videoZoomFactor;

@property(nonatomic,weak)id<ZFAVCaptureSessionDelegate> delegate;

///开始捕获
-(void)startRunning;
///停止捕获
-(void)stopRunning;
///切换摄像头
-(void)switchsCamera:(AVCaptureDevicePosition)devicePosition;
/// 聚焦点  默认是连续聚焦模式
- (void)focusAtPoint:(CGPoint)focalPoint;



#pragma mark --- 私有方法
@property(nonatomic,strong,readonly)AVCaptureDeviceInput *videoInput;
@property(nonatomic,strong,readonly)AVCaptureDeviceInput *audioInput;

@end

NS_ASSUME_NONNULL_END
