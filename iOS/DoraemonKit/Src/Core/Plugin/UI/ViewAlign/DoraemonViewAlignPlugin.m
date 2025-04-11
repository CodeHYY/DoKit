//
//  DoraemonViewAlignPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/6/16.
//

#import "DoraemonKit/Src/Core/Plugin/UI/ViewAlign/DoraemonViewAlignPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/UI/ViewAlign/Function/DoraemonViewAlignManager.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"


@implementation DoraemonViewAlignPlugin

- (void)pluginDidLoad{
    [[DoraemonViewAlignManager shareInstance] show];
    [[DoraemonHomeWindow shareInstance] hide];
}

@end
