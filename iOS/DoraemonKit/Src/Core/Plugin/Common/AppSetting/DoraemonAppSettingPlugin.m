//
//  DoraemonAppSettingPlugin.m
//  DoraemonKit
//
//  Created by didi on 2020/2/28.
//

#import "DoraemonKit/Src/Core/Plugin/Common/AppSetting/DoraemonAppSettingPlugin.h"
#import "DoraemonKit/Src/Core/Util/DoraemonUtil.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonAppSettingPlugin

- (void)pluginDidLoad {
    [DoraemonUtil openAppSetting];
    [[DoraemonHomeWindow shareInstance] hide];
}

@end
