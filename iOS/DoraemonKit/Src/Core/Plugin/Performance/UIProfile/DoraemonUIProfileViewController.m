//
//  DoraemonUIProfileViewController.m
//  DoraemonKit
//
//  Created by xgb on 2019/8/1.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/UIProfile/DoraemonUIProfileViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/CellSwitch/DoraemonCellSwitch.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/UIProfile/Function/DoraemonUIProfileManager.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@interface DoraemonUIProfileViewController () <DoraemonSwitchViewDelegate>

@property (nonatomic, strong) DoraemonCellSwitch *switchView;

@end

@implementation DoraemonUIProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = DoraemonLocalizedString(@"UI层级");
    
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750(104))];
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"UI层级检查开关") switchOn:[DoraemonUIProfileManager sharedInstance].enable];
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
    [DoraemonUIProfileManager sharedInstance].enable = on;
    [[DoraemonHomeWindow shareInstance] hide];
}

@end
