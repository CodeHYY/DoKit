//
//  DoraemonColorPickPlugin.m
//  DoraemonKit
//
//  Created by yixiang on 2018/3/5.
//

#import "DoraemonKit/Src/Core/Plugin/UI/ColorPick/DoraemonColorPickPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/UI/ColorPick/Function/DoraemonColorPickWindow.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"
#import "DoraemonKit/Src/Core/Plugin/UI/ColorPick/Function/DoraemonColorPickInfoWindow.h"

@implementation DoraemonColorPickPlugin

- (void)pluginDidLoad {
    [[DoraemonColorPickWindow shareInstance] show];
    [[DoraemonColorPickInfoWindow shareInstance] show];
    [[DoraemonHomeWindow shareInstance] hide];
}

@end
