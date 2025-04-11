//
//  DoraemonFPSPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/3.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/FPS/DoraemonFPSPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/FPS/DoraemonFPSViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonFPSPlugin

- (void)pluginDidLoad{
    DoraemonFPSViewController *vc = [[DoraemonFPSViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
