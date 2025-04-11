//
//  DoraemonANRPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/6/13.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/ANR/DoraemonANRPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/ANR/DoraemonANRViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonANRPlugin

- (void)pluginDidLoad{
    DoraemonANRViewController *vc = [[DoraemonANRViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
