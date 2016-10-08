//
//  UIColor+QDImage.h
//  LMQD
//
//  Created by min zhang on 15/10/9.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (QDImage)

/**
 *  @brief 纯色创建一张图片
 *
 *  @param 图片大小
 */
- (UIImage *)qd_imageWithSize:(CGSize)size;

/**
 *  @brief 纯色创建一张1*1的图片
 */
- (UIImage *)qd_image;

@end
