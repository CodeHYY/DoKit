//
//  DoraemonNSUserDefaultsPlugin.m
//  DoraemonKit
//
//  Created by 0xd-cc on 2019/11/26.
//

#import "DoraemonKit/Src/Core/Plugin/Common/NSUserDefaults/DoraemonNSUserDefaultsPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSUserDefaults/ViewControllers/DoraemonNSUserDefaultsViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonNSUserDefaultsPlugin
- (void)pluginDidLoad{
    DoraemonNSUserDefaultsViewController *vc = [[DoraemonNSUserDefaultsViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
