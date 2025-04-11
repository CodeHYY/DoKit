//
//  DoraemonMockDataPreviewViewController.h
//  DoraemonKit
//
//  Created by didi on 2019/11/17.
//

#import "DoraemonKit/Src/Core/Base/DoraemonBaseViewController.h"
#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/Model/DoraemonMockUpLoadModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DoraemonMockDataPreviewViewController : DoraemonBaseViewController

@property (nonatomic, strong) DoraemonMockUpLoadModel *upLoadModel;

@end

NS_ASSUME_NONNULL_END
