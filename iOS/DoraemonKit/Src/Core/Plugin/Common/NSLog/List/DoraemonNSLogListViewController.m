//
//  DoraemonNSLogListViewController.m
//  DoraemonKit
//
//  Created by yixiang on 2018/11/26.
//

#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/List/DoraemonNSLogListViewController.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/Function/DoraemonNSLogManager.h"
#import "DoraemonKit/Src/Core/Category/UIView+Doraemon.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/List/DoraemonNSLogListCell.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/Function/DoraemonNSLogModel.h"
#import "DoraemonKit/Src/Core/Plugin/Common/NSLog/List/DoraemonNSLogSearchView.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"
#import "DoraemonKit/Src/Core/Base/DoraemonNavBarItemModel.h"

@interface DoraemonNSLogListViewController ()<UITableViewDelegate,UITableViewDataSource,DoraemonNSLogSearchViewDelegate>

@property (nonatomic, strong) DoraemonNSLogSearchView *searchView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation DoraemonNSLogListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = DoraemonLocalizedString(@"NSLog日志记录");
    
    DoraemonNavBarItemModel *model1 = [[DoraemonNavBarItemModel alloc] initWithText:DoraemonLocalizedString(@"清除") color:[UIColor doraemon_blue] selector:@selector(clear)];
    DoraemonNavBarItemModel *model2 = [[DoraemonNavBarItemModel alloc] initWithText:DoraemonLocalizedString(@"导出") color:[UIColor doraemon_blue] selector:@selector(export)];
    [self setRightNavBarItems:@[model1,model2]];
    
    //按照时间倒序排列
    self.dataArray = [[[DoraemonNSLogManager sharedInstance].dataArray reverseObjectEnumerator] allObjects];
    
  
    _searchView = [[DoraemonNSLogSearchView alloc] initWithFrame:CGRectMake(kDoraemonSizeFrom750_Landscape(32), IPHONE_NAVIGATIONBAR_HEIGHT+kDoraemonSizeFrom750_Landscape(32), self.view.doraemon_width-2*kDoraemonSizeFrom750_Landscape(32), kDoraemonSizeFrom750_Landscape(100))];
    _searchView.delegate = self;
    [self.view addSubview:_searchView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _searchView.doraemon_bottom+kDoraemonSizeFrom750_Landscape(32), self.view.doraemon_width, self.view.doraemon_height-_searchView.doraemon_bottom-kDoraemonSizeFrom750_Landscape(32)) style:UITableViewStylePlain];
//    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)clear {
    [[DoraemonNSLogManager sharedInstance].dataArray removeAllObjects];
    self.dataArray = [[NSArray alloc] init];
    [self.tableView reloadData];
}

- (void)export {
    NSArray<DoraemonNSLogModel *> *dataArray = [[DoraemonNSLogManager sharedInstance].dataArray  copy];
    NSMutableString *log = [[NSMutableString alloc] init];
    for (DoraemonNSLogModel *model in dataArray) {
        NSString *time = [NSString stringWithFormat:@"[%@]",[DoraemonUtil dateFormatTimeInterval:model.timeInterval]];
        [log appendString:time];
        [log appendString:@" "];
        [log appendString:model.content];
        [log appendString:@"\n"];
    }
    
    [DoraemonUtil shareText:log formVC:self];
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoraemonNSLogModel* model = [self.dataArray objectAtIndex:indexPath.row];
    return [DoraemonNSLogListCell cellHeightWith:model];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"httpcell";
    DoraemonNSLogListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[DoraemonNSLogListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    DoraemonNSLogModel* model = [self.dataArray objectAtIndex:indexPath.row];
    [cell renderCellWithData:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DoraemonNSLogModel* model = [self.dataArray objectAtIndex:indexPath.row];
    model.expand = !model.expand;
    [self.tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return DoraemonLocalizedString(@"复制");
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    DoraemonNSLogModel* model = [self.dataArray objectAtIndex:indexPath.row];
    NSString *content = model.content;
    if (content.length>0) {
        UIPasteboard *pboard = [UIPasteboard generalPasteboard];
        pboard.string = content;
    }
}

#pragma mark - DoraemonNSLogSearchViewDelegate
- (void)searchViewInputChange:(NSString *)text{
    if (text.length > 0) {
        NSArray *dataArray = [[[DoraemonNSLogManager sharedInstance].dataArray reverseObjectEnumerator] allObjects];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for(DoraemonNSLogModel *model in dataArray){
            NSString *content = model.content;
            if ([content containsString:text]) {
                [resultArray addObject:model];
            }
        }
        self.dataArray = [[NSArray alloc] initWithArray:resultArray];
    }else{
        self.dataArray = [[[DoraemonNSLogManager sharedInstance].dataArray reverseObjectEnumerator] allObjects];
    }

    [self.tableView reloadData];
}


@end
