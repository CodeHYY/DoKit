//
//  DoraemonViewMetricsPlugin.m
//  DoraemonKit
//
//  Created by xgb on 2018/12/11.
//

#import "DoraemonKit/Src/Core/Plugin/UI/ViewMetrics/DoraemonViewMetricsPlugin.h"
#import "DoraemonKit/Src/Core/Plugin/UI/ViewMetrics/DoraemonMetricsViewController.h"
#import "DoraemonKit/Src/Core/Entry/Home/DoraemonHomeWindow.h"

@implementation DoraemonViewMetricsPlugin

- (void)pluginDidLoad{
    DoraemonMetricsViewController *vc = [[DoraemonMetricsViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
