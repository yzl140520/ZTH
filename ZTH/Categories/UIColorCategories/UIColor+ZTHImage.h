//
//  UIColor+ZTHImage.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZTHImage)

/**
 *  @brief 纯色创建一张图片
 *
 *  @param 图片大小
 */
- (UIImage *)zth_imageWithSize:(CGSize)size;

/**
 *  @brief 纯色创建一张1*1的图片
 */
- (UIImage *)zth_image;
@end
