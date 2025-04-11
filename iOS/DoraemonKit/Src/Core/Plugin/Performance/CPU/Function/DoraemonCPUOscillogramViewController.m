//
//  DoraemonCPUOscillogramViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/Function/DoraemonCPUOscillogramViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/Oscillogram/DoraemonOscillogramView.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/Function/DoraemonCPUUtil.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/Function/DoraemonCPUOscillogramWindow.h"

@interface DoraemonCPUOscillogramViewController ()


@end

@implementation DoraemonCPUOscillogramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)title{
    return DoraemonLocalizedString(@"CPU检测");
}

- (NSString *)lowValue{
    return @"0";
}

- (NSString *)highValue{
    return @"100";
}

- (void)closeBtnClick{
    [[DoraemonCacheManager sharedInstance] saveCpuSwitch:NO];
    [[DoraemonCPUOscillogramWindow shareInstance] hide];
}

//每一秒钟采样一次cpu使用率
- (void)doSecondFunction{
    CGFloat cpuUsage = [DoraemonCPUUtil cpuUsageForApp];
    if (cpuUsage * 100 > 100) {
        cpuUsage = 100;
    }else{
        cpuUsage = cpuUsage * 100;
    }
    // 0~100   对应 高度0~_oscillogramView.doraemon_height
    [self.oscillogramView addHeightValue:cpuUsage*self.oscillogramView.doraemon_height/100. andTipValue:[NSString stringWithFormat:@"%.f",cpuUsage]];
}

@end
