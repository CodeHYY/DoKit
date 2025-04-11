//
//  DoraemonNetFlowDetailViewController.h
//  DoraemonKit
//
//  Created by yixiang on 2018/4/13.
//

#import "DoraemonKit/Src/Core/Base/DoraemonBaseViewController.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/DoraemonNetFlowHttpModel.h"

@interface DoraemonNetFlowDetailViewController : DoraemonBaseViewController

@property (nonatomic, strong) DoraemonNetFlowHttpModel *httpModel;

@end
