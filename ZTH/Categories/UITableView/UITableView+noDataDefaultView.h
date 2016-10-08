//
//  UITableView+noDataDefaultView.h
//  ztjyyd
//  经常会有这样的需求，当UITableView没有数据的时候
//  会默认显示一张图片和提示语，此扩展提供接口，能很快方便的显示
//  默认提示界面
//  Created by yzl on 16/6/14.
//  Copyright © 2016年 szy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (noDataDefaultView)

/*!
 *  @author yzl
 *
 *  @brief 显示默认无数据视图
 */
- (void)showNoDataDefaultView;

/*!
 *  @author yzl
 *
 *  @brief 显示无数据视图
 *
 *  @param imageName 图片名字，如果为nil，只显示文字提示
 *  @param message   文字提示
 */
- (void)showNoDataDefaultViewWithImageName:(NSString*)imageName
                                   message:(NSString*)message;
- (void)showNoDataDefaultViewWithImage:(UIImage*)image
                               message:(NSString*)message;
/*!
 *  @author yzl
 *
 *  @brief 显示没数据状态
 *
 *  @param image             要显示的图片
 *  @param message           显示消息
 *  @param detailMessage     显示次级消息，字体会小些
 *  @param buttonTitle       显示按钮的标题
 *  @param buttonActionBlock 点击按钮要执行的操作
 */
- (void)showNoDataDefaultViewWithImage:(UIImage *)image
                               message:(NSString *)message
                         detailMessage:(NSString*)detailMessage
                           buttonTitle:(NSString*)buttonTitle
                     buttonActionBlock:(void(^)(void))buttonActionBlock;

- (void)hideNoDataDefaultView;

- (void)setMessageColor:(UIColor*)messageColor;

- (void)setMessageFont:(UIFont*)messageFont;

- (void)setDetailMessageColor:(UIColor*)messageColor;

- (void)setDetailMessageFont:(UIFont*)messageFont;
@end
