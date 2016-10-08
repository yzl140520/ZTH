//
//  ZTHListMenu.h
//  ZTH
//
//  Created by yzl on 16/8/15.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTHListMenuItemInfo.h"
@interface ZTHListMenu : UIView
/*
 * 列表
 */
@property (strong,nonatomic) UITableView* tableMenu;



- (instancetype)initWithMenuItems:(NSMutableArray*)menuItems menuWidth:(CGFloat)menuWidth;

- (void)show;
- (void)hideMenu;
@end
