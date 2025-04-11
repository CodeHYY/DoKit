//
//  DoraemonSubThreadUICheckPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/9/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/SubThreadUICheck/DoraemonSubThreadUICheckPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/SubThreadUICheck/DoraemonSubThreadUICheckViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonSubThreadUICheckPlugin

- (void)pluginDidLoad{
    DoraemonSubThreadUICheckViewController *vc = [[DoraemonSubThreadUICheckViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
