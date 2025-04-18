//
//  DoraemonNetFlowListCell.h
//  DoraemonKit
//
//  Created by yixiang on 2018/4/13.
//

#import <UIKit/UIKit.h>
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/DoraemonNetFlowHttpModel.h"

@interface DoraemonNetFlowListCell : UITableViewCell

- (void)renderCellWithModel:(DoraemonNetFlowHttpModel *)httpModel;

+ (CGFloat)cellHeightWithModel:(DoraemonNetFlowHttpModel *)httpModel;

@end
