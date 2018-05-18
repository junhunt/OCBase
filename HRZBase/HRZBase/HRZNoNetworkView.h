//
//  HRZNoNetworkView.h
//  HRZBase
//
//  Created by lvjunhang on 2018/5/18.
//  Copyright © 2018年 hrz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRZNoNetworkView : UIView
//是否显示加载失败页面，默认为显示
@property (nonatomic, assign, getter=isShowNoNetworkSet) BOOL showNoNetworkSet;
//加载失败页面标题，默认：加载失败
@property (nonatomic, copy) NSString *noNetworkSetTitle;
//加载失败页面副标题，默认：请检查您的网络是否正常
@property (nonatomic, copy) NSString *noNetworkSetDetailTitle;
//加载失败页面图片，默认：自设
@property (nonatomic, copy) NSString *noNetworkSetImage;
//加载失败页面按钮标题
@property (nonatomic, copy) NSString *noNetworkSetButtonTitle;
//加载失败页面按钮图片
@property (nonatomic, copy) NSString *noNetworkSetButtonImage;

/**
 *  用来显示网络加载时，无数据和无网络两种情况下的界面显示视图
 *  注意：建议在基类中创建，暴露属性给子类调用
 *  @param view                 当前控制器的View
 *  @param mainTitle            主标题
 *  @param subtitle             副标题
 *  @param imageName            显示图片
 *  @param whetherDisplayButton BOOL值，是否显示底部的刷新按钮
 *  @param buttonTitle          刷新按钮按钮的标题
 */
- (void)showInView:(UIView *)view title:(NSString *)mainTitle description:(NSString *)subtitle image:(NSString *)imageName whetherDisplayButton:(BOOL)whetherDisplayButton buttonTitle:(NSString *)buttonTitle completion:(void (^)(void))completion;

- (void)showInView:(UIView *)view completion:(void (^)(void))completion;

/**
 *  移除无网络视图
 */
- (void)removeNoNetworkView;

@end
