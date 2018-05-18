//
//  HRZBaseViewController.m
//  HRZBase
//
//  Created by lvjunhang on 2018/5/15.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import "HRZBaseViewController.h"
#import "RealReachability.h"

@interface HRZBaseViewController ()

@end

@implementation HRZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];
}

- (void)networkChanged:(NSNotification *)notification
{
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    NSLog(@"currentStatus:%@",@(status));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (HRZNoNetworkView *)noNetworkView
{
    if (_noNetworkView == nil) {
        _noNetworkView = [[HRZNoNetworkView alloc]init];
    }
    return _noNetworkView;
}
@end
