//
//  HRZSubTableViewController.m
//  HRZBase
//
//  Created by lvjunhang on 2018/5/15.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import "HRZSubTableViewController.h"

@interface HRZSubTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation HRZSubTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"继承的自定义";
    self.noDataSetButtonTitle = @"tap to reload";
    
    self.dataArray = [NSMutableArray array];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)headerRefresh {
    [self.networkManager fetchImageList];
}

#pragma mark - HRZNetworkManagerDelegate
- (void)networkManager:(HRZNetworkManager *)manager fetchData:(id)data
{
    [super networkManager:manager fetchData:data];
    
    self.dataArray = data;
    [self.tableView reloadData];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
//    [self headerRefresh];
    
    __weak typeof(self) weakSelf = self;
    [self.noNetworkView showInView:self.view completion:^{
        [weakSelf.noNetworkView removeNoNetworkView];
    }];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
@end
