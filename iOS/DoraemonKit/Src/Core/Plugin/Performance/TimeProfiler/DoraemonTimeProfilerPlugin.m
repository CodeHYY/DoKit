//
//  DoraemonTimeProfilerPlugin.m
//  DoraemonKit
//
//  Created by didi on 2019/10/15.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/TimeProfiler/DoraemonTimeProfilerPlugin.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/TimeProfiler/DoraemonTimeProfilerViewController.h"

@implementation DoraemonTimeProfilerPlugin

- (void)pluginDidLoad{
    DoraemonTimeProfilerViewController *vc = [[DoraemonTimeProfilerViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
