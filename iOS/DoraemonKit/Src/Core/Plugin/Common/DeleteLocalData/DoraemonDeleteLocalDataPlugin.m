//
//  DoraemonDeleteLocalDataPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/11/22.
//

#import "DoraemonKit/Src/Core/Plugin/Common/DeleteLocalData/DoraemonDeleteLocalDataPlugin.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Common/DeleteLocalData/DoraemonDeleteLocalDataViewController.h"

@implementation DoraemonDeleteLocalDataPlugin

- (void)pluginDidLoad{
    DoraemonDeleteLocalDataViewController *vc = [[DoraemonDeleteLocalDataViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
