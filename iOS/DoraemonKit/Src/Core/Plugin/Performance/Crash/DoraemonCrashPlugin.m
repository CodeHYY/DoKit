//
//  DoraemonCrashPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/6/19.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/Crash/DoraemonCrashPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/Crash/DoraemonCrashViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonCrashPlugin

- (void)pluginDidLoad{
    DoraemonCrashViewController *vc = [[DoraemonCrashViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
