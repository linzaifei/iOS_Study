//
//  ZFAVCaptureAVSession.h
//  IOSTips
//
//  Created by zifei on 2021/3/24.
//

#import "ZFAVCaptureSession.h"

NS_ASSUME_NONNULL_BEGIN
@class ZFAVCaptureAVSession;
@protocol ZFAVCaptureAVSessionDelegate <NSObject>

- (void)captureVideoSession:(ZFAVCaptureAVSession*)session didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;
- (void)captureAudioSession:(ZFAVCaptureAVSession*)session didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;

@end
@interface ZFAVCaptureAVSession : ZFAVCaptureSession

@end

NS_ASSUME_NONNULL_END
