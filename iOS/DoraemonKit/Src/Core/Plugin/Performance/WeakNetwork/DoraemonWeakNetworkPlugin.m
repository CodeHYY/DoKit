//
//  DoraemonWeakNetworkPlugin.m
//  DoraemonKit
//
//  Created by didi on 2019/11/21.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/WeakNetwork/DoraemonWeakNetworkPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/WeakNetwork/DoraemonWeakNetworkViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonWeakNetworkPlugin

- (void)pluginDidLoad{
    DoraemonWeakNetworkViewController *vc = [[DoraemonWeakNetworkViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
