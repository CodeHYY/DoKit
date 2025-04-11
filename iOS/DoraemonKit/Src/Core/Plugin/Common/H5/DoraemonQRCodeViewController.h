//
//  DoraemonQRCodeViewController.h
//  DoraemonKit
//
//  Created by love on 2019/5/22.
//

#import <Foundation/Foundation.h>
#import "DoraemonKit/Src/Core/Base/DoraemonBaseViewController.h"

@interface DoraemonQRCodeViewController : DoraemonBaseViewController
@property (nonatomic, copy) void(^QRCodeBlock)(NSString *QRCodeResult);
@end

