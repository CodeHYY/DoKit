//
//  DoraemonJavaScriptPlugin.m
//  AFNetworking
//
//  Created by carefree on 2022/5/11.
//

#import "DoraemonKit/Src/Core/Plugin/Common/JavaScript/DoraemonJavaScriptPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/Common/JavaScript/Function/DoraemonJavaScriptManager.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonJavaScriptPlugin

- (void)pluginDidLoad {
    [[DoraemonHomeWindow shareInstance] hide];
    [[DoraemonJavaScriptManager shareInstance] show];
}

@end
