//
//  DoraemonH5Plugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/5/4.
//

#import "DoraemonKit/Src/Core/Plugin/Common/H5/DoraemonH5Plugin.h"
#import "DoraemonKit/Src/Core/Plugin/Common/H5/DoraemonH5ViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonH5Plugin

- (void)pluginDidLoad{
    DoraemonH5ViewController *vc = [[DoraemonH5ViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
