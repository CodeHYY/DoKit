//
//  BarChart.h
//  DoraemonKit
//
//  Created by 0xd on 2019/9/11.
//  Copyright © 2019 000. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraemonKit/Src/Core/CommonUI/Charts/DoraemonChart.h"
#import "DoraemonKit/Src/Core/CommonUI/Charts/DoraemonXAxis.h"
#import "DoraemonKit/Src/Core/CommonUI/Charts/DoraemonYAxis.h"
#import "DoraemonKit/Src/Core/CommonUI/Charts/DoraemonChartDataItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DoraemonBarChart : DoraemonChart
@property (nonatomic, strong) DoraemonXAxis *xAxis;
@property (nonatomic, strong) DoraemonYAxis *yAxis;
@property (nonatomic, assign) CGFloat barsSpacingRatio;

@end

NS_ASSUME_NONNULL_END
