//
//  DoraemonMemoryPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/25.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/Memory/DoraemonMemoryPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/Memory/DoraemonMemoryViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonMemoryPlugin

- (void)pluginDidLoad{
    DoraemonMemoryViewController *vc = [[DoraemonMemoryViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
