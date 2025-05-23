//
//  DoraemonDBCell.m
//  DoraemonKit
//
//  Created by yixiang on 2019/4/1.
//

#import "DoraemonKit/Src/Core/Plugin/Common/Sanbox/VC/DB/DoraemonDBCell.h"
#import "DoraemonKit/Src/Core/Plugin/Common/Sanbox/VC/DB/DoraemonDBRowView.h"

@interface DoraemonDBCell()

@end

@implementation DoraemonDBCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _rowView = [[DoraemonDBRowView alloc] init];
        [self.contentView addSubview:_rowView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _rowView.frame = self.contentView.bounds;
}

- (void)renderCellWithArray:(NSArray *)array{
    _rowView.dataArray = array;
}

@end
