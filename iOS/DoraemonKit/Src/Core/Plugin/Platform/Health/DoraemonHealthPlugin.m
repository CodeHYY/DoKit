//
//  DoraemonHealthPlugin.m
//  DoraemonKit
//
//  Created by didi on 2019/12/30.
//

#import "DoraemonKit/Src/Core/Plugin/Platform/Health/DoraemonHealthPlugin.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Health/DoraemonHealthViewController.h"
#import "DoraemonManager.h"
#import "DoraemonKit/Src/Core/CommonUI/Toast/DoraemonToastUtil.h"
#import "DoraemonKit/Src/Core/Category/UIViewController+Doraemon.h"
#import "DoraemonKit/Src/Core/Util/Doraemoni18NUtil.h"

@implementation DoraemonHealthPlugin

- (void)pluginDidLoad{
    if ([DoraemonManager shareInstance].pId) {
        DoraemonHealthViewController *vc = [[DoraemonHealthViewController alloc] init];
        [DoraemonHomeWindow openPlugin:vc];
    }else{
        [DoraemonToastUtil showToastBlack:DoraemonLocalizedString(@"需要到www.dokit.cn上注册pId才能使用该功能") inView:[UIViewController rootViewControllerForDoraemonHomeWindow].view];
    }
}

@end
