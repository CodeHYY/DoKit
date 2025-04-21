//
//  DoraemonMockBaseViewController.h
//  DoraemonKit
//
//  Created by didi on 2019/11/7.
//

#import "DoraemonBaseViewController.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/View/Filter/DoraemonMockFilterListView.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/View/Filter/DoraemonMockFilterButton.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/View/Search/DoraemonMockSearchView.h"

@interface DoraemonMockBaseViewController : DoraemonBaseViewController

@property (nonatomic, strong) DoraemonMockSearchView *searchView;
@property (nonatomic, strong) UIView *sepeatorLine;
@property (nonatomic, strong) DoraemonMockFilterListView *listView;
@property (nonatomic, strong) DoraemonMockFilterButton *leftButton;
@property (nonatomic, strong) DoraemonMockFilterButton *rightButton;

- (void)filterSelectedClick;

@end

