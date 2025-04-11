//
//  DoraemonNetFlowOscillogramViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/5/2.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/View/DoraemonNetFlowOscillogramViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/Oscillogram/DoraemonOscillogramView.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/DoraemonNetFlowDataSource.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/View/DoraemonNetFlowOscillogramWindow.h"

@interface DoraemonNetFlowOscillogramViewController ()

@end

@implementation DoraemonNetFlowOscillogramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)title{
    return DoraemonLocalizedString(@"网络监控");
}

- (NSString *)lowValue{
    return @"0";
}

- (NSString *)highValue{
    return [NSString stringWithFormat:@"%zi",[self highestNetFlow]];
}

- (void)closeBtnClick{
    [[DoraemonCacheManager sharedInstance] saveNetFlowSwitch:NO];
    [[DoraemonNetFlowOscillogramWindow shareInstance] hide];
}

//每一秒钟采样一次流量情况
- (void)doSecondFunction{
    NSUInteger useNetFlowForApp = 0.;
    NSUInteger totalNetFlowForDevice = [self highestNetFlow];
    
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval start = now - 1;
    
    NSMutableArray<DoraemonNetFlowHttpModel *> *httpModelArray = [DoraemonNetFlowDataSource shareInstance].httpModelArray;
    
    NSInteger totalNetFlow = 0.;
    for (DoraemonNetFlowHttpModel *httpModel in httpModelArray) {
        NSTimeInterval netFlowEndTime = httpModel.endTime;
        if (netFlowEndTime >= start && netFlowEndTime <= now) {
            NSString *upFlow = httpModel.uploadFlow;
            NSString *downFlow = httpModel.downFlow;
            NSUInteger upFlowInt = [upFlow integerValue];
            NSUInteger downFlowInt = [downFlow integerValue];
            totalNetFlow += (upFlowInt + downFlowInt);
        }
    }
    
    useNetFlowForApp = totalNetFlow;
    
    // 0~highestNetFlow   对应 高度0~200
    [self.oscillogramView addHeightValue:useNetFlowForApp*self.oscillogramView.doraemon_height/totalNetFlowForDevice andTipValue:[NSString stringWithFormat:@"%ziB",useNetFlowForApp]];
}

- (NSUInteger)highestNetFlow {
    return 1000;//10000Byte
}

@end
