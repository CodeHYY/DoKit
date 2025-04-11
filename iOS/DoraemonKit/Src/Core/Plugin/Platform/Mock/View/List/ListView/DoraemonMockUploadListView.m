//
//  DoraemonMockUploadListView.m
//  DoraemonKit
//
//  Created by didi on 2019/11/15.
//

#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/View/List/ListView/DoraemonMockUploadListView.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/View/List/Cell/DoraemonMockUploadCell.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/Function/DoraemonMockUtil.h"

@interface DoraemonMockUploadListView()

@end

@implementation DoraemonMockUploadListView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dataArray = [[DoraemonMockManager sharedInstance] filterUpLoadArray];
    }
    return self;
}

- (void)reloadUI{
    self.dataArray = [[DoraemonMockManager sharedInstance] filterUpLoadArray];
    [super reloadUI];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoraemonMockBaseModel* model = [self.dataArray objectAtIndex:indexPath.row];
    return [DoraemonMockUploadCell cellHeightWith:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"detailcell";
    DoraemonMockUploadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[DoraemonMockUploadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.delegate = self;
    }
    DoraemonMockBaseModel* model = [self.dataArray objectAtIndex:indexPath.row];
    [cell renderCellWithData:model];
    return cell;
}

#pragma mark - DoraemonMockBaseCellDelegate
- (void)previewClick:(DoraemonMockUpLoadModel *)uploadModel{
    if (_delegate && [_delegate respondsToSelector:@selector(previewClick:)]) {
        [_delegate previewClick:uploadModel];
    }
}

- (void)cellSwitchClick{
    [[DoraemonMockUtil sharedInstance] saveUploadArrayCache];
    [self.tableView reloadData];
}
@end
