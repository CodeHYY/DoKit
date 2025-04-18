//
//  DoraemonCPUOscillogramWindow.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/Function/DoraemonCPUOscillogramWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/CPU/Function/DoraemonCPUOscillogramViewController.h"

@implementation DoraemonCPUOscillogramWindow

+ (DoraemonCPUOscillogramWindow *)shareInstance{
    static dispatch_once_t once;
    static DoraemonCPUOscillogramWindow *instance;
    dispatch_once(&once, ^{
        instance = [[DoraemonCPUOscillogramWindow alloc] initWithFrame:CGRectZero];
    });
    return instance;
}

- (void)addRootVc{
    DoraemonCPUOscillogramViewController *vc = [[DoraemonCPUOscillogramViewController alloc] init];
    self.rootViewController = vc;
    self.vc = vc;
}


@end
