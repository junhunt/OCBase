//
//  HRZTableViewController.h
//  HRZBase
//
//  Created by lvjunhang on 2018/5/15.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import "HRZBaseViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import "HRZNetworkManager.h"

@interface HRZTableViewController : HRZBaseViewController <UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, HRZNetworkDelegate>

@property (nonatomic, strong) HRZNetworkManager *networkManager;

@property (nonatomic, strong) UITableView *tableView;

/// 以下为无数据页面常用设置，更多设置可直接继承复写 DZNEmptyDataSetDelegate

//是否显示空数据页面，默认为显示
@property (nonatomic, assign, getter=isShowNoDataSet) BOOL showNoDataSet;
//空数据页面标题，默认：暂无任何数据
@property (nonatomic, copy) NSString *noDataSetTitle;
//空数据页面副标题，默认不显示
@property (nonatomic, copy) NSString *noDataSetDetailTitle;
//空数据页面图片，默认不显示
@property (nonatomic, copy) NSString *noDataSetImage;
//空数据页面按钮标题
@property (nonatomic, copy) NSString *noDataSetButtonTitle;
//空数据页面按钮图片
@property (nonatomic, copy) NSString *noDataSetButtonImage;

- (instancetype)initWithTableViewStyle:(UITableViewStyle)style;

#pragma mark - Header & footer Refresh
- (void)headerRefresh;
- (void)footerRefresh;
@end
