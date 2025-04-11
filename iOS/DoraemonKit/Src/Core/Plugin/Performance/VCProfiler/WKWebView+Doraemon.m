//
//  WKWebView+Doraemon.m
//  DoraemonKit
//
//  Created by didi on 2020/2/7.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/VCProfiler/WKWebView+Doraemon.h"
#import <objc/runtime.h>
#import "DoraemonKit/Src/Core/Category/NSObject+Doraemon.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Health/Function/DoraemonHealthManager.h"

@implementation WKWebView (Doraemon)

+ (void)load{
    [self doraemon_swizzleInstanceMethodWithOriginSel:@selector(loadRequest:) swizzledSel:@selector(doraemon_loadRequest:)];
}

- (WKNavigation *)doraemon_loadRequest:(NSURLRequest *)request{
    WKNavigation *navigation = [self doraemon_loadRequest:request];
    NSString *urlString = request.URL.absoluteString;
    [[DoraemonHealthManager sharedInstance] openH5Page:urlString];
    return navigation;
}

@end
