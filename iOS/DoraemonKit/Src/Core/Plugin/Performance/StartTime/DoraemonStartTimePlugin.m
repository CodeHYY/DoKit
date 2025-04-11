//
//  DoraemonStartTimePlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2019/7/17.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/StartTime/DoraemonStartTimePlugin.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/StartTime/DoraemonStartTimeViewController.h"

@implementation DoraemonStartTimePlugin

- (void)pluginDidLoad{
    DoraemonStartTimeViewController *vc = [[DoraemonStartTimeViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
