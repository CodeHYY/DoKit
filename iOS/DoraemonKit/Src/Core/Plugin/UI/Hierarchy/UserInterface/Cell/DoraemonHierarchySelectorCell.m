//
//  DoraemonHierarchySelectorCell.m
//  DoraemonKit
//
//  Created by lijiahuan on 2019/11/2.
//

#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/UserInterface/Cell/DoraemonHierarchySelectorCell.h"

@implementation DoraemonHierarchySelectorCell

#pragma mark - Over write
- (void)initUI {
    [super initUI];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end
