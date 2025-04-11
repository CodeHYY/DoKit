//
//  DoraemonMockBaseModel.m
//  DoraemonKit
//
//  Created by didi on 2019/11/15.
//

#import "DoraemonKit/Src/Core/Plugin/Platform/Mock/Model/DoraemonMockBaseModel.h"
#import "DoraemonKit/Src/Core/Define/DoraemonDefine.h"

@implementation DoraemonMockBaseModel

-  (void)appendFormat:(NSMutableString *)info text:(NSString *)text append:(NSString *)appendInfo{
    [info appendFormat:DoraemonLocalizedString(text),appendInfo];
}

@end
