//
//  DoraemonCPUPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/DoraemonCPUPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/DoraemonCPUViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonCPUPlugin

- (void)pluginDidLoad{
    DoraemonCPUViewController *vc = [[DoraemonCPUViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
