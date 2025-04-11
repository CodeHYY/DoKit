//
//  DoraemonMockBaseListView.h
//  DoraemonKit
//
//  Created by didi on 2019/11/15.
//

#import <UIKit/UIKit.h>
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/Model/DoraemonMockBaseModel.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/Function/DoraemonMockManager.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/View/List/Cell/DoraemonMockBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DoraemonMockBaseListView : UIView<DoraemonMockBaseCellDelegate>

@property (nonatomic, copy) NSArray<DoraemonMockBaseModel *> *dataArray;
@property (nonatomic, strong) UITableView *tableView;

- (void)reloadUI;

@end

NS_ASSUME_NONNULL_END
