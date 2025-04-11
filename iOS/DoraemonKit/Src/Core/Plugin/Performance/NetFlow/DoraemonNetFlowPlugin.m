//
//  DoraemonNetFlowPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/4/9.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/DoraemonNetFlowPlugin.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/DoraemonNetFlowViewController.h"

@implementation DoraemonNetFlowPlugin

- (void)pluginDidLoad{
    DoraemonNetFlowViewController *vc = [[DoraemonNetFlowViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
