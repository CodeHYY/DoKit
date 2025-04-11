//
//  DoraemonSubThreadUICheckViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/9/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/SubThreadUICheck/DoraemonSubThreadUICheckViewController.h"
#import "DoraemonKit/Src/Core/CommonUI/CellSwitch/DoraemonCellSwitch.h"
#import "DoraemonKit/Src/Core/CommonUI/CellBtn/DoraemonCellButton.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/SubThreadUICheck/List/DoraemonSubThreadUICheckListViewController.h"
#import "DoraemonKit/Src/Core/Util/Doraemoni18NUtil.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"

@interface DoraemonSubThreadUICheckViewController ()<DoraemonSwitchViewDelegate,DoraemonCellButtonDelegate>

@property (nonatomic, strong) DoraemonCellSwitch *switchView;
@property (nonatomic, strong) DoraemonCellButton *cellBtn;

@end

@implementation DoraemonSubThreadUICheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = DoraemonLocalizedString(@"子线程UI");
    
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"子线程UI渲染检测开关") switchOn:[[DoraemonCacheManager sharedInstance] subThreadUICheckSwitch]];
    [_switchView needTopLine];
    [_switchView needDownLine];
    _switchView.delegate = self;
    [self.view addSubview:_switchView];
    
    _cellBtn = [[DoraemonCellButton alloc] initWithFrame:CGRectMake(0, _switchView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    [_cellBtn renderUIWithTitle:DoraemonLocalizedString(@"查看检测记录")];
    _cellBtn.delegate = self;
    [_cellBtn needDownLine];
    [self.view addSubview:_cellBtn];

}

- (BOOL)needBigTitleView{
    return YES;
}

#pragma mark -- DoraemonSwitchViewDelegate
- (void)changeSwitchOn:(BOOL)on sender:(id)sender{
    [[DoraemonCacheManager sharedInstance] saveSubThreadUICheckSwitch:on];
}

#pragma mark -- DoraemonCellButtonDelegate
- (void)cellBtnClick:(id)sender{
    if (sender == _cellBtn) {
        DoraemonSubThreadUICheckListViewController *vc = [[DoraemonSubThreadUICheckListViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
