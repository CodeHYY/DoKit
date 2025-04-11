//
//  DoraemonFPSOscillogramWindow.m
//  DoraemonKit
//
//  Created by yixiang on 2018/1/12.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/FPS/Function/DoraemonFPSOscillogramWindow.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/FPS/Function/DoraemonFPSOscillogramViewController.h"

@implementation DoraemonFPSOscillogramWindow

+ (DoraemonFPSOscillogramWindow *)shareInstance{
    static dispatch_once_t once;
    static DoraemonFPSOscillogramWindow *instance;
    dispatch_once(&once, ^{
        instance = [[DoraemonFPSOscillogramWindow alloc] initWithFrame:CGRectZero];
    });
    return instance;
}

- (void)addRootVc{
    DoraemonFPSOscillogramViewController *vc = [[DoraemonFPSOscillogramViewController alloc] init];
    self.rootViewController = vc;
    self.vc = vc;
}

@end
