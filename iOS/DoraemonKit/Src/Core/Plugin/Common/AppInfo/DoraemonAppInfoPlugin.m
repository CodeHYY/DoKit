//
//  DoraemonAppInfoPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/4/13.
//

#import "DoraemonKit/Src/Core/Plugin/Common/AppInfo/DoraemonAppInfoPlugin.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Common/AppInfo/DoraemonAppInfoViewController.h"

@implementation DoraemonAppInfoPlugin

- (void)pluginDidLoad{
    DoraemonAppInfoViewController *vc = [[DoraemonAppInfoViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
