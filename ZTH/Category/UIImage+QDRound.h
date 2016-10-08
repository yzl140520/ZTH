//
//  UIImage+QDRound.h
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QDRound)

/**
 *  绘制一个圆型图片。如果图片是长的，会用最短边进行取园
 */
- (UIImage *)qd_applyRoundedCorners;

/**
 *  绘制一个带有圆角的图片
 */
- (UIImage *)qd_applyCornerRadius:(CGFloat)radius;

/**
 *  绘制一个圆形带描边的图片
 *
 *  @param color      描边颜色
 *  @param borderSize 描边宽度
 *
 *  @return 处理会的图片
 */
- (UIImage *)qd_applyRoundedCornerWithBorderColor:(UIColor *)color borderSize:(NSInteger)borderSize;

@end
