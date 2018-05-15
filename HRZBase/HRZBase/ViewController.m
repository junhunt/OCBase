//
//  ViewController.m
//  HRZBase
//
//  Created by lvjunhang on 2018/5/15.
//  Copyright © 2018年 lvjunhang. All rights reserved.
//

#import "ViewController.h"
#import "HRZSubTableViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *dataSources;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"常见空数据页面";
    
    self.dataSources = @[@"默认显示",@"自定义显示图片",@"自定义显示图片、文字",@"空数据时显示按钮触发事件", @"我的自定义", @"继承的自定义"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"XLCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataSources[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSources.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        [self.navigationController pushViewController:[[HRZTableViewController alloc] init] animated:YES];
    }
    if (indexPath.row == 5) {
        HRZSubTableViewController *vc = [[HRZSubTableViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
