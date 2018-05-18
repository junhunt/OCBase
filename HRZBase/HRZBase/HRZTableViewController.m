//
//  HRZTableViewController.m
//  HRZBase
//
//  Created by lvjunhang on 2018/5/15.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import "HRZTableViewController.h"
#import "KafkaRefresh.h"

@interface HRZTableViewController ()

@end

@implementation HRZTableViewController
{
    UITableViewStyle _tableViewStyle;
}

- (instancetype)initWithTableViewStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _tableViewStyle = style;
        self.showNoDataSet = YES;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableViewStyle = UITableViewStyleGrouped;
        self.showNoDataSet = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Header & footer Refresh
- (void)headerRefresh
{

}
- (void)footerRefresh
{
    
}
#pragma mark - HRZNetworkDelegate
- (void)networkManager:(HRZNetworkManager *)manager fetchData:(id)data {
    [self.tableView.headRefreshControl endRefreshing];
    [self.tableView.footRefreshControl endRefreshing];
    NSLog(@"%@", data);
}

- (void)networkManager:(HRZNetworkManager *)manager getError:(NSError *)error {
    [self.tableView.headRefreshControl endRefreshing];
    [self.tableView.footRefreshControl endRefreshing];
}

#pragma mark - DZNEmptyDataSetSource, DZNEmptyDataSetDelegate
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:self.noDataSetImage ?: @"NoData"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = self.noDataSetTitle ?: @"没有(⊙_⊙)?";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                                 NSForegroundColorAttributeName: [UIColor grayColor]};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    if (!self.noDataSetDetailTitle) return nil;
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    return [[NSAttributedString alloc] initWithString:self.noDataSetDetailTitle attributes:attributes];
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return self.isShowNoDataSet;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -self.tableView.tableHeaderView.frame.size.height/2.0f;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if (!self.noDataSetButtonTitle) return nil;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f]};
    return [[NSAttributedString alloc] initWithString:self.noDataSetButtonTitle attributes:attributes];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return self.noDataSetButtonImage?[UIImage imageNamed:self.noDataSetButtonImage]:nil;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
}

#pragma mark UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc]init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Lazy Load
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:_tableViewStyle];
        _tableView.estimatedRowHeight = 44.0f;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        __weak typeof(self) weak = self;
        [_tableView bindRefreshStyle:KafkaRefreshStyleNative fillColor:[UIColor redColor] atPosition:KafkaRefreshPositionHeader refreshHanler:^{
            [weak headerRefresh];
        }];
        [_tableView bindRefreshStyle:KafkaRefreshStyleNative fillColor:[UIColor redColor] atPosition:KafkaRefreshPositionFooter refreshHanler:^{
            [weak footerRefresh];
        }];
    }
    
    return _tableView;
}

- (HRZNetworkManager *)networkManager
{
    if (_networkManager == nil) {
        _networkManager = [[HRZNetworkManager alloc]init];
        _networkManager.delegate = self;
    }
    return _networkManager;
}
@end
