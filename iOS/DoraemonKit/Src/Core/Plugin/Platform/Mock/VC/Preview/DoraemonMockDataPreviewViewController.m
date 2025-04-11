//
//  DoraemonMockDataPreviewViewController.m
//  DoraemonKit
//
//  Created by didi on 2019/11/17.
//

#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/VC/Preview/DoraemonMockDataPreviewViewController.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/Function/DoraemonMockManager.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"

@interface DoraemonMockDataPreviewViewController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation DoraemonMockDataPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据预览";
    CGFloat upLoadBtnHeight = kDoraemonSizeFrom750_Landscape(100);
    CGFloat tabBarHeight = self.tabBarController.tabBar.doraemon_height;
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, IPHONE_NAVIGATIONBAR_HEIGHT, self.view.doraemon_width, self.view.doraemon_height-IPHONE_NAVIGATIONBAR_HEIGHT-tabBarHeight-upLoadBtnHeight)];
    _textView.text = self.upLoadModel.result;
    [self.view addSubview:_textView];
    
    UIButton *upLoadBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _textView.doraemon_bottom, self.view.doraemon_width, upLoadBtnHeight)];
    upLoadBtn.backgroundColor = [UIColor doraemon_blue];
    [upLoadBtn setTitle:DoraemonLocalizedString(@"上传模版") forState:UIControlStateNormal];
    [upLoadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [upLoadBtn addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upLoadBtn];
}

- (void)upload{
    [[DoraemonMockManager sharedInstance] uploadSaveData:self.upLoadModel atView:self.view];
}

@end
