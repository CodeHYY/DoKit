//
//  DoraemonViewCheckPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/3/28.
//

#import "DoraemonKit/Src/Core/Plugin/UI/ViewCheck/DoraemonViewCheckPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/UI/ViewCheck/Function/DoraemonViewCheckManager.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonViewCheckPlugin

- (void)pluginDidLoad{
    [[DoraemonViewCheckManager shareInstance] show];
    [[DoraemonHomeWindow shareInstance] hide];
}

@end
