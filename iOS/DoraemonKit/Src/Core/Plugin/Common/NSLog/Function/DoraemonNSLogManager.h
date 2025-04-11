//
//  DoraemonNSLogManager.h
//  DoraemonKit
//
//  Created by yixiang on 2018/11/26.
//

#import <Foundation/Foundation.h>
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/Function/DoraemonNSLogModel.h"


@interface DoraemonNSLogManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSMutableArray<DoraemonNSLogModel *> *dataArray;

- (void)startNSLogMonitor;

- (void)stopNSLogMonitor;

- (void)addNSLog:(NSString *)log;
@end
