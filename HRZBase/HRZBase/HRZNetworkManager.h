//
//  HRZNetworkManager.h
//  HRZBase
//
//  Created by lvjunhang on 2018/5/15.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HRZNetworkManager;
@protocol HRZNetworkDelegate <NSObject>
- (void)networkManager:(HRZNetworkManager *)manager fetchData:(id)data;
- (void)networkManager:(HRZNetworkManager *)manager getError:(NSError *)error;
@end

@interface HRZNetworkManager : NSObject
@property (nonatomic, weak) id<HRZNetworkDelegate> delegate;

- (void)fetchBanner;

- (void)fetchImageList;
@end
