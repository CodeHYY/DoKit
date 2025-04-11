//
//  DoraemonUIProfileManager.m
//  DoraemonKit
//
//  Created by xgb on 2019/8/1.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/UIProfile/Function/DoraemonUIProfileManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/UIProfile/Function/UIViewController+DoraemonUIProfile.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/UIProfile/Function/DoraemonUIProfileWindow.h"
#import "DoraemonKit/Src/Core/Category/UIViewController+Doraemon.h"

@interface DoraemonUIProfileManager ()

@end

@implementation DoraemonUIProfileManager

+ (instancetype)sharedInstance
{
    static DoraemonUIProfileManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DoraemonUIProfileManager new];
    });
    
    return sharedInstance;
}

- (void)setEnable:(BOOL)enable
{
    _enable = enable;
    if (enable) {
        [[UIViewController topViewControllerForKeyWindow] profileViewDepth];
    } else {
        [[UIViewController topViewControllerForKeyWindow] resetProfileData];
        [[DoraemonUIProfileWindow sharedInstance] hide];
    }
}

@end
