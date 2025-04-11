//
//  DoraemonLargeImagePlugin.m
//  DoraemonKit
//
//  Created by 0xd-cc on 2019/5/15.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/LargeImageDetection/DoraemonLargeImagePlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/LargeImageDetection/DoraemonLargeImageViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonLargeImagePlugin
- (void)pluginDidLoad {
    DoraemonLargeImageViewController *vc = [[DoraemonLargeImageViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
