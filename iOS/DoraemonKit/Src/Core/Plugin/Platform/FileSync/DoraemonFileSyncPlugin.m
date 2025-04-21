//
//  DoraemonFileSyncPlugin.m
//  DoraemonKit
//
//  Created by didi on 2020/6/10.
//

#import "DoraemonKit/Src/Core/Plugin/Platform/FileSync/DoraemonFileSyncPlugin.h"
#import "DoraemonManager.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/FileSync/DoraemonFileSyncViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/CommonUI/Toast/DoraemonToastUtil.h"
#import "DoraemonKit/Src/Core/Category/UIViewController+Doraemon.h"
#import "DoraemonKit/Src/Core/Util/Doraemoni18NUtil.h"

@implementation DoraemonFileSyncPlugin

- (void)pluginDidLoad{
    if ([DoraemonManager shareInstance].pId) {
        DoraemonFileSyncViewController *vc = [[DoraemonFileSyncViewController alloc] init];
        [DoraemonHomeWindow openPlugin:vc];
    }else{
        [DoraemonToastUtil showToastBlack:DoraemonLocalizedString(@"需要到www.dokit.cn上注册pId才能使用该功能") inView:[UIViewController rootViewControllerForDoraemonHomeWindow].view];
    }
}

@end
