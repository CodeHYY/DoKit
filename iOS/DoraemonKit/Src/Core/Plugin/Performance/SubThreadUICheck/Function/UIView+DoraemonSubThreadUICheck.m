//
//  UIView+Doraemon.m
//  DoraemonKit
//
//  Created by yixiang on 2018/9/13.
//

#import "DoraemonKit/Src/Core/Category/UIView+Doraemon.h"
#import "DoraemonKit/Src/Core/Category/NSObject+Doraemon.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/SubThreadUICheck/Function/DoraemonSubThreadUICheckManager.h"
#import "DoraemonKit/Src/Core/Util/DoraemonUtil.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Health/Function/DoraemonHealthManager.h"
#import "DoraemonKit/Src/Core/Util/BSBacktraceLogger/DoraemonBacktraceLogger.h"

@implementation UIView (DoraemonSubThreadUICheck)

+ (void)load{
    if ([NSStringFromClass([self class]) isEqualToString:@"UIView"]) {
        [[self  class] doraemon_swizzleInstanceMethodWithOriginSel:@selector(setNeedsLayout) swizzledSel:@selector(doraemon_setNeedsLayout)];
        [[self class] doraemon_swizzleInstanceMethodWithOriginSel:@selector(setNeedsDisplay) swizzledSel:@selector(doraemon_setNeedsDisplay)];
        [[self class] doraemon_swizzleInstanceMethodWithOriginSel:@selector(setNeedsDisplayInRect:) swizzledSel:@selector(doraemon_setNeedsDisplayInRect:)];
    }
}

- (void)doraemon_setNeedsLayout{
    [self doraemon_setNeedsLayout];
    [self uiCheck];
}

- (void)doraemon_setNeedsDisplay{
    [self doraemon_setNeedsDisplay];
    [self uiCheck];
}

- (void)doraemon_setNeedsDisplayInRect:(CGRect)rect{
    [self doraemon_setNeedsDisplayInRect:rect];
    [self uiCheck];
}

- (void)uiCheck{
    if(![NSThread isMainThread]){
        if ([[DoraemonCacheManager sharedInstance] subThreadUICheckSwitch]) {
            NSString *report = [DoraemonBacktraceLogger doraemon_backtraceOfCurrentThread];
            NSDictionary *dic = @{
                                  @"title":[DoraemonUtil dateFormatNow],
                                  @"content":report
                                  };
            [[DoraemonSubThreadUICheckManager sharedInstance].checkArray addObject:dic];
            [[DoraemonHealthManager sharedInstance] addSubThreadUI:dic];
        }
    }
}

@end
