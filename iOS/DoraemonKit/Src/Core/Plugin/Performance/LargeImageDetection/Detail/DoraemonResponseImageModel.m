//
//  DoraemonResponseImageModel.m
//  DoraemonKit
//
//  Created by 0xd-cc on 2019/5/16.
//

#import "DoraemonKit/Src/Core/Plugin/Performance/LargeImageDetection/Detail/DoraemonResponseImageModel.h"
#import "DoraemonKit/Src/Core/Plugin/Performance/NetFlow/Function/Util/DoraemonUrlUtil.h"

@implementation DoraemonResponseImageModel
- (instancetype)initWithResponse: (NSURLResponse *)response data:(NSData *) data {
    
    self = [[DoraemonResponseImageModel alloc] init];
    self.url = response.URL;
    self.data = data;
    int64_t byte = [DoraemonUrlUtil getResponseLength:(NSHTTPURLResponse *)response data:data];
    self.size = [NSByteCountFormatter stringFromByteCount: byte countStyle: NSByteCountFormatterCountStyleBinary];
    return self;
}
@end
