//
//  DoraemonMockPlugin.m
//  DoraemonKit
//
//  Created by didi on 2019/10/23.
//

#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/DoraemonMockPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/DoraemonMockViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonManager.h"
#import "DoraemonKit/Src/Core/CommonUI/Toast/DoraemonToastUtil.h"
#import "DoraemonKit/Src/Core/Category/UIViewController+Doraemon.h"
#import "DoraemonKit/Src/Core/Util/Doraemoni18NUtil.h"

@implementation DoraemonMockPlugin

- (void)pluginDidLoad{
    if ([DoraemonManager shareInstance].pId) {
        DoraemonMockViewController *vc = [[DoraemonMockViewController alloc] init];
        [DoraemonHomeWindow openPlugin:vc];
    }else{
        [DoraemonToastUtil showToastBlack:DoraemonLocalizedString(@"需要到www.dokit.cn上注册pId才能使用该功能") inView:[UIViewController rootViewControllerForDoraemonHomeWindow].view];
    }

}

@end
