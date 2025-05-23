//
//  NSURLSessionConfiguration+Doraemon.m
//  DoraemonKit
//
//  Created by yixiang on 2018/7/2.
//

#import "DoraemonKit/Src/Core/Network/Interceptor/NSURLSessionConfiguration+Doraemon.h"
#import "DoraemonKit/Src/Core/Network/Interceptor/DoraemonNSURLProtocol.h"
#import "DoraemonKit/Src/Core/Category/NSObject+Doraemon.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/DoraemonNetFlowManager.h"
#import "DoraemonKit/Src/Core/Cache/DoraemonCacheManager.h"


@implementation NSURLSessionConfiguration (Doraemon)

+ (void)load{
    [[self class] doraemon_swizzleClassMethodWithOriginSel:@selector(defaultSessionConfiguration) swizzledSel:@selector(doraemon_defaultSessionConfiguration)];
    [[self class] doraemon_swizzleClassMethodWithOriginSel:@selector(ephemeralSessionConfiguration) swizzledSel:@selector(doraemon_ephemeralSessionConfiguration)];
}

+ (NSURLSessionConfiguration *)doraemon_defaultSessionConfiguration{
    NSURLSessionConfiguration *configuration = [self doraemon_defaultSessionConfiguration];
    [configuration addDoraemonNSURLProtocol];
    return configuration;
}

+ (NSURLSessionConfiguration *)doraemon_ephemeralSessionConfiguration{
    NSURLSessionConfiguration *configuration = [self doraemon_ephemeralSessionConfiguration];
    [configuration addDoraemonNSURLProtocol];
    return configuration;
}

- (void)addDoraemonNSURLProtocol {
    if ([self respondsToSelector:@selector(protocolClasses)]
        && [self respondsToSelector:@selector(setProtocolClasses:)]) {
        NSMutableArray * urlProtocolClasses = [NSMutableArray arrayWithArray: self.protocolClasses];
        Class protoCls = DoraemonNSURLProtocol.class;
        if (![urlProtocolClasses containsObject:protoCls]) {
            [urlProtocolClasses insertObject:protoCls atIndex:0];
        }
        self.protocolClasses = urlProtocolClasses;
    }
}

@end
