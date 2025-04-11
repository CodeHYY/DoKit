//
//  DoraemonSandboxPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2017/12/11.
//

#import "DoraemonKit/Src/Core/Plugin/Common/Sanbox/DoraemonSandboxPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Common/Sanbox/VC/DoraemonSandboxViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonSandboxPlugin

- (void)pluginDidLoad{
    DoraemonSandboxViewController *vc = [[DoraemonSandboxViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
