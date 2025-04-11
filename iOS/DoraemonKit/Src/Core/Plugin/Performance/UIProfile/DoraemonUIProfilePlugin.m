//
//  DoraemonUIProfilePlugin.m
//  DoraemonKit
//
//  Created by xgb on 2019/8/1.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/UIProfile/DoraemonUIProfilePlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/UIProfile/DoraemonUIProfileViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonUIProfilePlugin

- (void)pluginDidLoad{
    DoraemonUIProfileViewController *vc = [[DoraemonUIProfileViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
