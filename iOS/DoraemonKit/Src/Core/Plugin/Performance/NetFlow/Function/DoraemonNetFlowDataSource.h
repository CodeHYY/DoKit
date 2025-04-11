//
//  DoraemonNetFlowDataSource.h
//  DoraemonKit
//
//  Created by yixiang on 2018/4/11.
//

#import <Foundation/Foundation.h>
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/DoraemonNetFlowHttpModel.h"

@interface DoraemonNetFlowDataSource : NSObject

@property (nonatomic, strong) NSMutableArray<DoraemonNetFlowHttpModel *> *httpModelArray;

+ (DoraemonNetFlowDataSource *)shareInstance;

- (void)addHttpModel:(DoraemonNetFlowHttpModel *)httpModel;

- (void)clear;

@end
