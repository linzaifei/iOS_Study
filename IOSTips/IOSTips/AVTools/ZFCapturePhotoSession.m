//
//  ZFCapturePhotoSession.m
//  IOSTips
//
//  Created by zifei on 2021/3/24.
//

#import "ZFCapturePhotoSession.h"
@interface ZFCapturePhotoSession()
@property(nonatomic,strong)AVCapturePhotoOutput *photoOutput; //图片输出
@end
@implementation ZFCapturePhotoSession



- (AVCapturePhotoOutput *)photoOutput{
    if (_photoOutput ==nil) {
        _photoOutput = [[AVCapturePhotoOutput alloc] init];
    }
    return _photoOutput;
}
@end
