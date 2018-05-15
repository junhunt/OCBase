//
//  HRZNetworkManager.m
//  HRZBase
//
//  Created by lvjunhang on 2018/5/15.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import "HRZNetworkManager.h"

@implementation HRZNetworkManager
#pragma mark - Life Cycle

- (void)fetchBanner
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(networkManager:fetchData:)]) {
            [self.delegate networkManager:self fetchData:@"fetchBanner success"];
        }
    });
}

- (void)fetchImageList
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(networkManager:fetchData:)]) {
            [self.delegate networkManager:self fetchData:@[@"1", @"2", @"3", @"4"]];
        }
    });
}
@end

