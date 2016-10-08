//
//  ZTHListMenuItemInfo.h
//  ZTH
//
//  Created by yzl on 16/8/15.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTHListMenuItemInfo : NSObject
/*
 * 图片
 */
@property (strong,nonatomic) NSString* imageName;
/*
 * 名称
 */
@property (strong,nonatomic) NSString* title;
/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief 事件
 */
@property (copy, nonatomic) void(^eventBlock)(void);
@end
