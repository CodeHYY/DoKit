//
//  DoraemonCPUViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/DoraemonCPUViewController.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/Function/DoraemonCPUOscillogramWindow.h"
#import "DoraemonKit/Src/Core/Util/Doraemoni18NUtil.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/Function/DoraemonCPUOscillogramViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/CellSwitch/DoraemonCellSwitch.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"

@interface DoraemonCPUViewController ()<DoraemonSwitchViewDelegate, DoraemonOscillogramWindowDelegate>

@property (nonatomic, strong) DoraemonCellSwitch *switchView;

@end

@implementation DoraemonCPUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = DoraemonLocalizedString(@"CPU检测");
    
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"CPU检测开关") switchOn:[[DoraemonCacheManager sharedInstance] cpuSwitch]];
    [_switchView needTopLine];
    [_switchView needDownLine];
    _switchView.delegate = self;
    [self.view addSubview:_switchView];
    [[DoraemonCPUOscillogramWindow shareInstance] addDelegate:self];
}

- (BOOL)needBigTitleView{
    return YES;
}

#pragma mark -- DoraemonSwitchViewDelegate
- (void)changeSwitchOn:(BOOL)on sender:(id)sender{
    [[DoraemonCacheManager sharedInstance] saveCpuSwitch:on];
    if(on){
        [[DoraemonCPUOscillogramWindow shareInstance] show];
    }else{
        [[DoraemonCPUOscillogramWindow shareInstance] hide];
    }
}

#pragma mark -- DoraemonOscillogramWindowDelegate
- (void)doraemonOscillogramWindowClosed {
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"CPU检测开关") switchOn:[[DoraemonCacheManager sharedInstance] cpuSwitch]];
}

@end
