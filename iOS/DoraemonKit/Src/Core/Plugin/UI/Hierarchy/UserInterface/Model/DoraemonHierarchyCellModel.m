//
//  DoraemonHierarchyCellModel.m
//  DoraemonKit
//
//  Created by lijiahuan on 2019/11/2.
//

#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/UserInterface/Model/DoraemonHierarchyCellModel.h"
#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/UserInterface/Cell/DoraemonHierarchyDetailTitleCell.h"
#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/UserInterface/Cell/DoraemonHierarchySelectorCell.h"
#import "DoraemonKit/Src/Core/Plugin/UI/Hierarchy/UserInterface/Cell/DoraemonHierarchySwitchCell.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"

@implementation DoraemonHierarchyCellModel

- (instancetype)initWithTitle:(NSString *)title flag:(BOOL)flag {
    return [self initWithTitle:title detailTitle:nil flag:flag];
}

- (instancetype)initWithTitle:(NSString *_Nullable)title detailTitle:(NSString *_Nullable)detailTitle flag:(BOOL)flag {
    if (self = [super init]) {
        _title = [title copy];
        _detailTitle = [detailTitle copy];
        _flag = flag;
        _cellClass = NSStringFromClass(DoraemonHierarchySwitchCell.class);
        _separatorInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle {
    if (self = [super init]) {
        _title = [title copy];
        _detailTitle = [detailTitle copy];
        _cellClass = NSStringFromClass(DoraemonHierarchyDetailTitleCell.class);
        _separatorInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return self;
}

- (DoraemonHierarchyCellModel *)normalInsets {
    self.separatorInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    return self;
}

- (DoraemonHierarchyCellModel *)noneInsets {
    self.separatorInsets = UIEdgeInsetsMake(0, DoraemonScreenWidth, 0, 0);
    return self;
}

- (void)setBlock:(void (^)(void))block {
    if (_block != block) {
        _block = [block copy];
        _cellClass = NSStringFromClass(block ? DoraemonHierarchySelectorCell.class : DoraemonHierarchyDetailTitleCell.class);
    }
}

@end
