//
//  DoraemonNSLogPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/11/25.
//

#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/DoraemonNSLogPlugin.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/DoraemonNSLogViewController.h"

@implementation DoraemonNSLogPlugin

- (void)pluginDidLoad{
    DoraemonNSLogViewController *vc = [[DoraemonNSLogViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
