//
//  DoraemonMetricsViewController.m
//  DoraemonKit
//
//  Created by xgb on 2019/1/10.
//

#import "DoraemonKit/Src/Core/Plugin/UI/ViewMetrics/DoraemonMetricsViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/CellSwitch/DoraemonCellSwitch.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Plugin/UI/ViewMetrics/Function/DoraemonViewMetricsConfig.h"

@interface DoraemonMetricsViewController () <DoraemonSwitchViewDelegate>

@property (nonatomic, strong) DoraemonCellSwitch *switchView;

@end

@implementation DoraemonMetricsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = DoraemonLocalizedString(@"布局边框");
    
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"布局边框开关") switchOn:[DoraemonViewMetricsConfig defaultConfig].enable];
    [_switchView needTopLine];
    [_switchView needDownLine];
    _switchView.delegate = self;
    [self.view addSubview:_switchView];
}

- (BOOL)needBigTitleView{
    return YES;
}

#pragma mark -- DoraemonSwitchViewDelegate
- (void)changeSwitchOn:(BOOL)on sender:(id)sender{
    [DoraemonViewMetricsConfig defaultConfig].opened = YES;
    [DoraemonViewMetricsConfig defaultConfig].enable = on;
}

@end
