//
//  ZFAVCaptureAVSession.m
//  IOSTips
//
//  Created by zifei on 2021/3/24.
//

#import "ZFAVCaptureAVSession.h"
@interface ZFAVCaptureAVSession()<AVCaptureAudioDataOutputSampleBufferDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>
@property(nonatomic,strong)AVCaptureVideoDataOutput *videoOutput; //视频输出
@property(nonatomic,strong)AVCaptureAudioDataOutput *audioOutput; //音频输出
@end
@implementation ZFAVCaptureAVSession




- (AVCaptureAudioDataOutput *)audioOutput{
    if (_audioOutput == nil) {
        _audioOutput = [[AVCaptureAudioDataOutput alloc] init];
        [_audioOutput setSampleBufferDelegate:self queue:dispatch_get_global_queue(0, 0)];
    }
    return _audioOutput;
}
- (AVCaptureVideoDataOutput *)videoOutput{
    if (_videoOutput == nil) {
        _videoOutput = [[AVCaptureVideoDataOutput alloc] init];
        [_videoOutput setSampleBufferDelegate:self queue:dispatch_get_global_queue(0, 0)];
    }
    return _videoOutput;
}


- (AVCaptureSession *)session{
    if (_session == nil) {
        _session = [[AVCaptureSession alloc] init];
        _session.sessionPreset =AVCaptureSessionPresetiFrame960x540;
        
        //video-input
        if([self.session canAddInput:self.videoInput]){
            [self.session addInput:self.videoInput];
        }
        if([self.session canAddInput:self.audioInput]){
            [self.session addInput:self.audioInput];
        }
        //video-output
        if ([self.session canAddOutput:self.audioOutput]) {
            [self.session addOutput:self.audioOutput];
        }
        if ([self.session canAddOutput:self.videoOutput]) {
            [self.session addOutput:self.videoOutput];
        }
        
        AVCaptureConnection *connection = [self.videoOutput connectionWithMediaType:AVMediaTypeVideo];
        // 设置是否为镜像，前置摄像头采集到的数据本来就是翻转的，这里设置为镜像把画面转回来
        if (self.devicePosition == AVCaptureDevicePositionFront && connection.supportsVideoMirroring) {
            connection.videoMirrored = YES;
        }
        connection.videoOrientation = AVCaptureVideoOrientationPortrait;
    }
    return _session;
}

-(void)startRunning{
    
    
    [super startRunning];
}

#pragma mark -- AVCaptureAudioDataOutputSampleBufferDelegate,AVCaptureVideoDataOutputSampleBufferDelegate
- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{
    
    if (output ==self.videoOutput) {
        if ([self.delegate respondsToSelector:@selector(captureVideoSession:didOutputSampleBuffer:fromConnection:)]) {
            [self.delegate captureVideoSession:self didOutputSampleBuffer:sampleBuffer fromConnection:connection];
        }
    }
    if (output==self.audioOutput) {
        if ([self.delegate respondsToSelector:@selector(captureAudioSession:didOutputSampleBuffer:fromConnection:)]) {
            [self.delegate captureAudioSession:self didOutputSampleBuffer:sampleBuffer fromConnection:connection];
        }
    }
}

@end
