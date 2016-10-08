//
//  UIBarButtonItem+QDNavigationBar.h
//  LMQD
//
//  Created by 阮景雄 on 15/9/7.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QDBarButtonItemType) {
    QDBarButtonItemTypeLeftButton,
    QDBarButtonItemTypeRightButton
};

@interface UIBarButtonItem (QDNavigationBar)

+ (UIBarButtonItem *)qd_backBarButtonItemWithTarget:(id)target
                                             action:(SEL)action;

+ (UIBarButtonItem *)qd_moreBarButtonItemWithTarget:(id)target
                                             action:(SEL)action;

+ (UIBarButtonItem *)qd_closeBarButtonItemWithTarget:(id)target
                                              action:(SEL)action;

+ (UIBarButtonItem *)qd_barButtonItemWithType:(QDBarButtonItemType)type
                                        title:(NSString *)title
                                       target:(id)target
                                       action:(SEL)action;

+ (UIBarButtonItem *)qd_barButtonItemWithType:(QDBarButtonItemType)type
                                  normalImage:(UIImage *)normalImage
                             highlightedImage:(UIImage *)highlightedImage
                                        title:(NSString *)title
                                   titleColor:(UIColor *)titleColor
                          titleHighlightColor:(UIColor *)highlightColor
                                       target:(id)target
                                       action:(SEL)action;

@end
