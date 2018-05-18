//
//  HRZNoNetworkView.m
//  HRZBase
//
//  Created by lvjunhang on 2018/5/18.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import "HRZNoNetworkView.h"

#define UISCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define UISCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface HRZNoNetworkView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIButton *refreshButton;

@property (nonatomic, copy) void (^completion)(void);
@end

@implementation HRZNoNetworkView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        self.showNoNetworkSet = YES;
        self.noNetworkSetTitle = @"加载失败";
        self.noNetworkSetDetailTitle = @"请检查您的网络是否正常";
        self.noNetworkSetImage = @"chaxun";
        self.noNetworkSetDetailTitle = @"重新加载";
        self.noNetworkSetButtonImage = nil;
        
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.frame = (CGRect){0, 64, UISCREEN_WIDTH, UISCREEN_HEIGHT - 64};
    
    self.imageView.center = CGPointMake(UISCREEN_WIDTH * 0.5, 95 + 50);
    self.imageView.bounds = CGRectMake(0, 0, 100, 100);
    
    CGRect rect = self.imageView.frame;
    CGFloat label_Y = CGRectGetMaxY(rect);
    self.titleLabel.frame = (CGRect){0, label_Y + 10, UISCREEN_WIDTH, 30};
    
    CGRect rect1 = self.titleLabel.frame;
    CGFloat chekNetLabel_Y = CGRectGetMaxY(rect1);
    self.subTitleLabel.frame = (CGRect){0, chekNetLabel_Y, UISCREEN_WIDTH, 30};
    
    CGRect rect2 = self.subTitleLabel.frame;
    CGFloat refreshButton_Y = CGRectGetMaxY(rect2);
    self.refreshButton.center = CGPointMake(UISCREEN_WIDTH * 0.5, refreshButton_Y + 30);
    self.refreshButton.bounds = CGRectMake(0, 0, 65, 30);
}

- (void)createUI
{
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.subTitleLabel = [[UILabel alloc] init];
    self.subTitleLabel.font = [UIFont systemFontOfSize:12];
    self.subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.subTitleLabel];
    
    self.refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.refreshButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.refreshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.refreshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
    self.refreshButton.layer.cornerRadius = 5;
    self.refreshButton.layer.masksToBounds = YES;
    self.refreshButton.layer.borderWidth = 1;
    self.refreshButton.layer.borderColor = [UIColor blackColor].CGColor;
}

// 显示网络加载错误，默认：加载失败 -- 请检查您的网络是否正常 -- 显示图片和刷新按钮
- (void)showInView:(UIView *)view completion:(void(^)(void))completion
{
    [self showInView:view title:self.noNetworkSetTitle description:self.noNetworkSetDetailTitle image:self.noNetworkSetImage whetherDisplayButton:YES buttonTitle:self.noNetworkSetButtonTitle completion:completion];
}

- (void)showInView:(UIView *)view title:(NSString *)mainTitle description:(NSString *)subtitle image:(NSString *)imageName whetherDisplayButton:(BOOL)whetherDisplayButton buttonTitle:(NSString *)buttonTitle completion:(void(^)(void))completion
{
    
    self.completion = completion;
    
    self.imageView.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = mainTitle;
    self.subTitleLabel.text = subtitle;
    
    if (whetherDisplayButton) {
        [self.refreshButton setTitle:buttonTitle forState:UIControlStateNormal];
        [self addSubview:self.refreshButton];
    }
    
    [view addSubview:self];
}

- (void)removeNoNetworkView
{
    if (self != nil) {
        [UIView animateWithDuration:0.6 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            self.alpha = 1;
        }];
    }
}

- (void)refresh:(UIButton *)sender
{
    if (self.completion) {
        self.completion();
    }
}

@end
