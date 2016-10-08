//
//  ZTHNoDataView.h
//  ztjyyd
//
//  Created by yzl on 16/6/12.
//  Copyright © 2016年 szy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTHNoDataView : UIView
/*!
 *  @author yzl
 *
 *  @brief 显示无数据提示界面
 *
 *  @param frame   界面frame
 *  @param image   图片，图片为nil时，只显示提示语
 *  @param message 提示信息
 *
 *  @return return value description
 */
+ (instancetype)noDataViewWithFrame:(CGRect)frame
                              image:(UIImage*)image
                            message:(NSString*)message
                      detailMessage:(NSString*)detailMessage
                        buttonTitle:(NSString*)buttonTitle
                    buttonActionBlock:(void(^)(void))buttonActionBlock;
;
/*!
 *  @author yzl
 *
 *  @brief 显示无数据提示界面
 *
 *  @param frame     界面frame
 *  @param imageName 图片名，图片名为nil时，只显示提示语
 *  @param message   提示信息
 *
 *  @return return value description
 */
+ (instancetype)noDataViewWithFrame:(CGRect)frame
                          imageName:(NSString*)imageName
                            message:(NSString*)message
                      detailMessage:(NSString*)detailMessage
                        buttonTitle:(NSString*)buttonTitle
                  buttonActionBlock:(void(^)(void))buttonActionBlock;
/*!
 *  @author yzl
 *
 *  @brief 显示默认界面，有默认图片和提示语
 *
 *  @param frame frame值
 *
 *  @return return value description
 */
+ (instancetype)defaultNoDataViewWithFrame:(CGRect)frame;

- (void)setMessageColor:(UIColor*)messageColor;

- (void)setMessageFont:(UIFont*)messageFont;

- (void)setDetailMessageColor:(UIColor*)messageColor;

- (void)setDetailMessageFont:(UIFont*)messageFont;

- (void)setButtonFrame:(CGRect)buttonFrame;

- (void)setButtonTitleColor:(UIColor*)color forState:(UIControlState)state;

- (void)setButtonBackgroundImage:(UIImage*)image forState:(UIControlState)state;

- (void)setButtonLayerCornerRadius:(CGFloat)radius;

- (void)setButtonTitleFont:(UIFont*)font;
@end
