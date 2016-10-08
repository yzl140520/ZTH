//
//  UIBarButtonItem+QDNavigationBar.m
//  LMQD
//
//  Created by 阮景雄 on 15/9/7.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import "UIBarButtonItem+QDNavigationBar.h"
#import "UIFont+QDFont.h"

@implementation UIBarButtonItem (QDNavigationBar)

+ (UIBarButtonItem *)qd_backBarButtonItemWithTarget:(id)target
                                             action:(SEL)action;
{
    UIImage *normalImage = [UIImage imageNamed:@"icon_return_black"];;
    UIImage *highlightedImage = [UIImage imageNamed:@"icon_return_highlight"];
    
    return [UIBarButtonItem qd_barButtonItemWithType:QDBarButtonItemTypeLeftButton
                                         normalImage:normalImage
                                    highlightedImage:highlightedImage
                                               title:nil
                                          titleColor:nil
                                 titleHighlightColor:nil
                                              target:target
                                              action:action];
}

+ (UIBarButtonItem *)qd_moreBarButtonItemWithTarget:(id)target
                                             action:(SEL)action;
{
    UIImage *normalImage = [UIImage imageNamed:@"icon_more_white"];;
    UIImage *highlightedImage = [UIImage imageNamed:@"icon_more_highlight"];
    
    return [UIBarButtonItem qd_barButtonItemWithType:QDBarButtonItemTypeRightButton
                                         normalImage:normalImage
                                    highlightedImage:highlightedImage
                                               title:nil
                                          titleColor:nil
                                 titleHighlightColor:nil
                                              target:target
                                              action:action];
}

+ (UIBarButtonItem *)qd_closeBarButtonItemWithTarget:(id)target
                                              action:(SEL)action;
{
    UIImage *normalImage = [UIImage imageNamed:@"icon_closed"];
    UIImage *highlightedImage = [UIImage imageNamed:@"icon_closed_highlight"];
    
    return [UIBarButtonItem qd_barButtonItemWithType:QDBarButtonItemTypeLeftButton
                                         normalImage:normalImage
                                    highlightedImage:highlightedImage
                                               title:nil
                                          titleColor:nil
                                 titleHighlightColor:nil
                                              target:target
                                              action:action];
}

+ (UIBarButtonItem *)qd_barButtonItemWithType:(QDBarButtonItemType)type
                                        title:(NSString *)title
                                       target:(id)target
                                       action:(SEL)action
{
    return [UIBarButtonItem qd_barButtonItemWithType:type
                                         normalImage:nil
                                    highlightedImage:nil
                                               title:title
                                          titleColor:RGBAHEX(0x1e1d20, 0.8f)
                                 titleHighlightColor:RGBAHEX(0xf13c68, 0.8f)
                                              target:target
                                              action:action];
}

+ (UIBarButtonItem *)qd_barButtonItemWithType:(QDBarButtonItemType)type
                                  normalImage:(UIImage *)normalImage
                             highlightedImage:(UIImage *)highlightedImage
                                        title:(NSString *)title
                                   titleColor:(UIColor *)titleColor
                          titleHighlightColor:(UIColor *)highlightColor
                                       target:(id)target
                                       action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    button.titleLabel.font = [UIFont qd_defaultFontWithSize:15.f];
    [button setFrame:(CGRect){CGPointZero, CGSizeMake(70.f, 40.f)}];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitleColor:titleColor
                 forState:UIControlStateNormal];
    [button setTitleColor:highlightColor
                 forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor]
                 forState:UIControlStateDisabled];
    
    CGFloat offset = 6.f + 8.f;
    if (type == QDBarButtonItemTypeRightButton) {
        if (normalImage) {
            [button setImageEdgeInsets:UIEdgeInsetsMake(0.f, offset, 0.f, -offset)];
        }
        if (title.length) {
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0.f, offset, 0.f, -offset)];
        }
    }
    else if (type == QDBarButtonItemTypeLeftButton) {
        if (normalImage) {
            [button setImageEdgeInsets:UIEdgeInsetsMake(0.f, -offset, 0.f, offset)];
        }
        if (title.length) {
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0.f, -offset, 0.f, offset)];
        }
    }
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 8.f, 0, 8.f);
    [button setContentEdgeInsets:inset];
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
