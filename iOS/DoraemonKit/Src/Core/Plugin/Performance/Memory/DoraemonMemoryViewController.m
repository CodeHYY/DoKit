//
//  DoraemonMemoryViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/25.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/Memory/DoraemonMemoryViewController.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/Memory/Function/DoraemonMemoryOscillogramWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/Memory/Function/DoraemonMemoryOscillogramViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/CellSwitch/DoraemonCellSwitch.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"

@interface DoraemonMemoryViewController ()<DoraemonSwitchViewDelegate, DoraemonOscillogramWindowDelegate>

@property (nonatomic, strong) DoraemonCellSwitch *switchView;

@end

@implementation DoraemonMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = DoraemonLocalizedString(@"内存检测");
    
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"内存检测开关") switchOn:[[DoraemonCacheManager sharedInstance] memorySwitch]];
    [_switchView needTopLine];
    [_switchView needDownLine];
    _switchView.delegate = self;
    [self.view addSubview:_switchView];
    [[DoraemonMemoryOscillogramWindow shareInstance] addDelegate:self];
}

- (BOOL)needBigTitleView{
    return YES;
}

#pragma mark -- DoraemonSwitchViewDelegate
- (void)changeSwitchOn:(BOOL)on sender:(id)sender{
    [[DoraemonCacheManager sharedInstance] saveMemorySwitch:on];
    if(on){
        [[DoraemonMemoryOscillogramWindow shareInstance] show];
    }else{
        [[DoraemonMemoryOscillogramWindow shareInstance] hide];
    }
}

#pragma mark -- DoraemonOscillogramWindowDelegate
- (void)doraemonOscillogramWindowClosed {
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"内存检测开关") switchOn:[[DoraemonCacheManager sharedInstance] memorySwitch]];
}

@end
