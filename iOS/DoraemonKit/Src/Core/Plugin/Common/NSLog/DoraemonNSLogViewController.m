//
//  DoraemonNSLogViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/11/25.
//

#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/DoraemonNSLogViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/CellSwitch/DoraemonCellSwitch.h"
#import "DoraemonKit/Src/Core/CommonUI/CellBtn/DoraemonCellButton.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/List/DoraemonNSLogListViewController.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/Function/DoraemonNSLogManager.h"

@interface DoraemonNSLogViewController ()<DoraemonSwitchViewDelegate,DoraemonCellButtonDelegate>

@property (nonatomic, strong) DoraemonCellSwitch *switchView;
@property (nonatomic, strong) DoraemonCellButton *cellBtn;

@end

@implementation DoraemonNSLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"NSLog";
    
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"开关") switchOn:[[DoraemonCacheManager sharedInstance] nsLogSwitch]];
    [_switchView needTopLine];
    [_switchView needDownLine];
    _switchView.delegate = self;
    [self.view addSubview:_switchView];
    
    _cellBtn = [[DoraemonCellButton alloc] initWithFrame:CGRectMake(0, _switchView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_cellBtn renderUIWithTitle:DoraemonLocalizedString(@"查看记录")];
    _cellBtn.delegate = self;
    [_cellBtn needDownLine];
    [self.view addSubview:_cellBtn];
    
}

- (BOOL)needBigTitleView{
    return YES;
}

#pragma mark -- DoraemonSwitchViewDelegate
- (void)changeSwitchOn:(BOOL)on sender:(id)sender{
    [[DoraemonCacheManager sharedInstance] saveNSLogSwitch:on];
    if (on) {
        [[DoraemonNSLogManager sharedInstance] startNSLogMonitor];
    }else{
        [[DoraemonNSLogManager sharedInstance] stopNSLogMonitor];
    }
}

#pragma mark -- DoraemonCellButtonDelegate
- (void)cellBtnClick:(id)sender{
    if (sender == _cellBtn) {
        DoraemonNSLogListViewController *vc = [[DoraemonNSLogListViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
