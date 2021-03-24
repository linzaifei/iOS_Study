//
//  ZFAVCaptureSession.m
//  IOSTips
//
//  Created by zifei on 2021/3/23.
//

#import "ZFAVCaptureSession.h"

@interface ZFAVCaptureSession() <AVCaptureAudioDataOutputSampleBufferDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>


//@property(nonatomic,strong)AVCaptureSession *session; //绘画
@property(nonatomic,strong)AVCaptureVideoPreviewLayer *previewLayer; //预览
@property(nonatomic,strong)AVCaptureDeviceInput *videoInput; //视频输入
@property(nonatomic,strong)AVCaptureDeviceInput *audioInput;//音频输入


//@property(nonatomic,strong)AVCaptureMetadataOutput *metadataOutput; //元数据
//
//@property(nonatomic,strong)AVCaptureVideoDataOutput *videoOutput; //视频输出
//@property(nonatomic,strong)AVCaptureAudioDataOutput *audioOutput; //音频输出


@end
@implementation ZFAVCaptureSession

//+(instancetype)shareCaptureSesstion{
//    static dispatch_once_t onceToken;
//    static ZFAVCaptureSession *_capture;
//    dispatch_once(&onceToken, ^{
//        _capture = [[ZFAVCaptureSession alloc] init];
//        [_capture startConfig];
//    });
//    return  _capture;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self startConfig];
    }
    return self;
}

-(void)startConfig{
    self.videoGravity = AVLayerVideoGravityResizeAspect;
}

#pragma mark -- tools
-(AVCaptureDevice *)getDeviceWithPosition:(AVCaptureDevicePosition) position{
    if (@available(iOS 10.2, *)) {
        AVCaptureDeviceDiscoverySession *dissession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeBuiltInDualCamera,AVCaptureDeviceTypeBuiltInTelephotoCamera,AVCaptureDeviceTypeBuiltInWideAngleCamera] mediaType:AVMediaTypeVideo position:position];
        for (AVCaptureDevice *device in dissession.devices) {
            if ([device position] == position) {
                return device;
            }
        }
    } else {
        NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
        for (AVCaptureDevice *device in devices) {
            if ([device position] == position) {
                return device;
            }
        }
    }
    return nil;
}

-(CGFloat)minZoomFactor{
    CGFloat minZoomFactor = 1.0;
    if (@available(iOS 11.0, *)) {
        minZoomFactor = [self.videoInput device].minAvailableVideoZoomFactor;
    }
    return minZoomFactor;
}
-(CGFloat)maxZoomFactor{
    CGFloat maxZoomFactor = [self.videoInput device].activeFormat.videoMaxZoomFactor;
    if (@available(iOS 11.0, *)) {
         maxZoomFactor =  [self.videoInput device].maxAvailableVideoZoomFactor;
    }
    return maxZoomFactor;
}

#pragma mark -- 懒加载
- (AVCaptureVideoPreviewLayer *)previewLayer{
    if (_previewLayer==nil) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
        _previewLayer.videoGravity=self.videoGravity;
    }
    return _previewLayer;
}

- (AVCaptureDeviceInput *)videoInput{
    if (_videoInput ==nil) {
        AVCaptureDevice *device = [self getDeviceWithPosition:AVCaptureDevicePositionBack];
        _videoInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
        if (!_videoInput) {
            [NSException exceptionWithName:@"videoInput" reason:@"video设备错误" userInfo:nil];
        }
    }
    return _videoInput;
}

- (AVCaptureDeviceInput *)audioInput{
    if (_audioInput == nil) {
        AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
        _audioInput = [AVCaptureDeviceInput deviceInputWithDevice:audioDevice error:nil];
        if (!_audioInput) {
            [NSException exceptionWithName:@"audioInput" reason:@"audio设备错误" userInfo:nil];
        }
    }
    return _audioInput;
}
//
//- (AVCaptureAudioDataOutput *)audioOutput{
//    if (_audioOutput == nil) {
//        _audioOutput = [[AVCaptureAudioDataOutput alloc] init];
//        [_audioOutput setSampleBufferDelegate:self queue:dispatch_get_global_queue(0, 0)];
//    }
//    return _audioOutput;
//}
//- (AVCaptureVideoDataOutput *)videoOutput{
//    if (_videoOutput == nil) {
//        _videoOutput = [[AVCaptureVideoDataOutput alloc] init];
//        [_videoOutput setSampleBufferDelegate:self queue:dispatch_get_global_queue(0, 0)];
//    }
//    return _videoOutput;
//}


//
//- (AVCaptureSession *)session{
//    if (_session == nil) {
//        _session = [[AVCaptureSession alloc] init];
//        _session.sessionPreset =AVCaptureSessionPresetiFrame960x540;
//
//        //video-input
//        if([self.session canAddInput:self.videoInput]){
//            [self.session addInput:self.videoInput];
//        }
//        if([self.session canAddInput:self.audioInput]){
//            [self.session addInput:self.audioInput];
//        }
//        //video-output
//        if ([self.session canAddOutput:self.audioOutput]) {
//            [self.session addOutput:self.audioOutput];
//        }
//        if ([self.session canAddOutput:self.videoOutput]) {
//            [self.session addOutput:self.videoOutput];
//        }
//
//        AVCaptureConnection *connection = [self.videoOutput connectionWithMediaType:AVMediaTypeVideo];
//        // 设置是否为镜像，前置摄像头采集到的数据本来就是翻转的，这里设置为镜像把画面转回来
//        if (self.devicePosition == AVCaptureDevicePositionFront && connection.supportsVideoMirroring) {
//            connection.videoMirrored = YES;
//        }
//        connection.videoOrientation = AVCaptureVideoOrientationPortrait;
//    }
//    return _session;
//}

#pragma mark -- Events
///开始捕获
-(void)startRunning{
    if (!self.session.isRunning) {
        [self.session startRunning];
    }
}

///停止捕获
-(void)stopRunning{
    if (self.session.isRunning) {
        [self.session stopRunning];
    }
}
///切换摄像头
-(void)switchsCamera:(AVCaptureDevicePosition)devicePosition{
    if (self.devicePosition == devicePosition) {
        return;
    }
    //重新配置输入
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:[self getDeviceWithPosition:devicePosition] error:nil];
    [self.session beginConfiguration];
    [self.session removeInput:self.videoInput];
    if ([self.session canAddInput:input]) {
        [self.session addInput:input];
        self.videoInput = input;
    }else{
        [self.session addInput:self.videoInput];
    }
    [self.session commitConfiguration];
}
/// 聚焦点  默认是连续聚焦模式
- (void)focusAtPoint:(CGPoint)focalPoint{
    CGPoint point = [self.previewLayer captureDevicePointOfInterestForPoint:focalPoint];
    AVCaptureDevice *device =  [self.videoInput device];
    NSError *error;
    //注意改变设备属性前一定要首先调用lockForConfiguration:调用完之后使用unlockForConfiguration方法解锁
    if ([device lockForConfiguration:&error]) {
        if ([device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus]) {
            if ([device isFocusPointOfInterestSupported]) {
                [device setFocusPointOfInterest:point];
            }
        }
        
        //曝光度
        if([device isExposureModeSupported:AVCaptureExposureModeAutoExpose]){
            if ([device isExposurePointOfInterestSupported]) {
                [device setExposurePointOfInterest:point];
            }
        }
        [device unlockForConfiguration];
    }else{
        NSLog(@"设置聚焦点错误：%@", error.localizedDescription);
    }
}



#pragma mark -- Setter
- (void)setPreview:(UIView *)preview{
    if (preview == nil) {
        [self.previewLayer removeFromSuperlayer];
    }else {
        self.previewLayer.frame = preview.bounds;
        [preview.layer addSublayer:self.previewLayer];
    }
    _preview = preview;
}
//- (void)setFlashMode:(AVCaptureFlashMode)flashMode{
//    //只有拍照才能设置闪光灯
//    if (!self.photoOutput) {
//        return;
//    }
//    AVCaptureDevice *device = [self.videoInput device];
//    if (device.hasFlash && device.flashAvailable) {
////        AVCapturePhotoSettings * s
////        self.videoOutput.videoSettings//
////        self.photoOutput.
//    }
//
//    _flashMode = flashMode;
//}
- (void)setVideoZoomFactor:(CGFloat)videoZoomFactor{
    NSError *error;
    if (videoZoomFactor>=[self minZoomFactor] && videoZoomFactor<=[self maxZoomFactor]) {
        [[self.videoInput device] lockForConfiguration:&error];
        [self.videoInput device].videoZoomFactor = videoZoomFactor;
        [[self.videoInput device] unlockForConfiguration];
    }else{
        NSLog( @"调节焦距失败: %@", error );
    }
}
#pragma mark -- Getter
///是否正在捕获中
-(BOOL)isRunning{
    return self.session.isRunning;
}
- (AVCaptureDevicePosition)devicePosition{
    if ([self.videoInput device].position == AVCaptureDevicePositionUnspecified) {
        return AVCaptureDevicePositionBack;
    }
    return [self.videoInput device].position;
}
- (CGFloat)videoZoomFactor{
    return  [self.videoInput device].videoZoomFactor;
}
//#pragma mark -- AVCaptureAudioDataOutputSampleBufferDelegate,AVCaptureVideoDataOutputSampleBufferDelegate
//- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{
//
//    if (output ==self.videoOutput) {
//        if ([self.delegate respondsToSelector:@selector(captureVideoSession:didOutputSampleBuffer:fromConnection:)]) {
//            [self.delegate captureVideoSession:self didOutputSampleBuffer:sampleBuffer fromConnection:connection];
//        }
//    }
//    if (output==self.audioOutput) {
//        if ([self.delegate respondsToSelector:@selector(captureAudioSession:didOutputSampleBuffer:fromConnection:)]) {
//            [self.delegate captureAudioSession:self didOutputSampleBuffer:sampleBuffer fromConnection:connection];
//        }
//    }
//}

#pragma mark -- 销毁
- (void)dealloc {
    [self stopRunning];
}
@end
