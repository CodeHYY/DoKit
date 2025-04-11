//
//  DoraemonHierarchyPlugin.m
//  DoraemonKit
//
//  Created by lijiahuan on 2019/11/2.
//

#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/DoraemonHierarchyPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/UserInterface/DoraemonHierarchyWindow.h"
#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/Function/DoraemonHierarchyHelper.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"


@implementation DoraemonHierarchyPlugin

- (void)pluginDidLoad {
    DoraemonHierarchyWindow *window = [[DoraemonHierarchyWindow alloc] init];
    [DoraemonHierarchyHelper shared].window = window;
    [window show];
    [[DoraemonHomeWindow shareInstance] hide];
}

@end
