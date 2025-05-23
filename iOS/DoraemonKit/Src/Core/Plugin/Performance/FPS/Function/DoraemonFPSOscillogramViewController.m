//
//  DoraemonFPSOscillogramViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/FPS/Function/DoraemonFPSOscillogramViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/Oscillogram/DoraemonOscillogramView.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/FPS/Function/DoraemonFPSOscillogramWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/FPS/Function/DoraemonFPSUtil.h"


@interface DoraemonFPSOscillogramViewController ()

@property (nonatomic, strong) DoraemonFPSUtil *fpsUtil;

@end

@implementation DoraemonFPSOscillogramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)title{
    return DoraemonLocalizedString(@"帧率检测");
}

- (NSString *)lowValue{
    return @"0";
}

- (NSString *)highValue{
    return @"60";
}


- (void)closeBtnClick{
    [[DoraemonCacheManager sharedInstance] saveFpsSwitch:NO];
    [[DoraemonFPSOscillogramWindow shareInstance] hide];
}

- (void)startRecord{
    if (!_fpsUtil) {
        _fpsUtil = [[DoraemonFPSUtil alloc] init];
        __weak typeof(self) weakSelf = self;
        [_fpsUtil addFPSBlock:^(NSInteger fps) {
            // 0~60   对应 高度0~_oscillogramView.doraemon_height
            [weakSelf.oscillogramView addHeightValue:fps*weakSelf.oscillogramView.doraemon_height/60. andTipValue:[NSString stringWithFormat:@"%zi",fps]];
        }];
    }
    [_fpsUtil start];
}

- (void)endRecord{
    if (_fpsUtil) {
        [_fpsUtil end];
    }
    [self.oscillogramView clear];
}

@end
