//
//  DoraemonNetFlowOscillogramWindow.m
//  DoraemonKit
//
//  Created by yixiang on 2018/5/2.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/View/DoraemonNetFlowOscillogramWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/View/DoraemonNetFlowOscillogramViewController.h"

@implementation DoraemonNetFlowOscillogramWindow

+ (DoraemonNetFlowOscillogramWindow *)shareInstance{
    static dispatch_once_t once;
    static DoraemonNetFlowOscillogramWindow *instance;
    dispatch_once(&once, ^{
        instance = [[DoraemonNetFlowOscillogramWindow alloc] initWithFrame:CGRectZero];
    });
    return instance;
}

- (void)addRootVc{
    DoraemonNetFlowOscillogramViewController *vc = [[DoraemonNetFlowOscillogramViewController alloc] init];
    self.rootViewController = vc;
    self.vc = vc;
}

@end
