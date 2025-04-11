//
//  DoraemonAppInfoViewController.h
//  DoraemonKit
//
//  Created by yixiang on 2018/4/13.
//

#import "DoraemonKit/Src/Core/Base/DoraemonBaseViewController.h"

@interface DoraemonAppInfoViewController : DoraemonBaseViewController

/// 自定义App信息处理
@property (class, nonatomic, copy) void (^customAppInfoBlock)(NSMutableArray<NSDictionary *> *appInfos);

@end
