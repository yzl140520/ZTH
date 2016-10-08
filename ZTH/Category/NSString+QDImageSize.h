//
//  NSString+QDImageSize.h
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QDImageSize)

/**
 *  返回图片缩放尺寸限定宽
 */
- (NSString *)qd_imageWithWidth:(CGFloat)width;

/**
 *  居中裁剪正方形图
 */
- (NSString *)qd_imageSize37;

/**
 *	@brief	返回头像尺寸为70pt
 *
 *	@return
 */
- (NSString *)qd_avatarImageSize70;

/**
 *	@brief	返回头像尺寸为60pt
 *
 *	@return
 */
- (NSString *)qd_avatarImageSize65;

/**
 *	@brief	返回头像尺寸为45pt
 *
 *	@return
 */
- (NSString *)qd_avatarImageSize45;

/**
 *	@brief	返回头像尺寸为40pt
 *
 *	@return
 */
- (NSString *)qd_avatarImageSize40;

/**
 *	@brief	返回头像尺寸为35pt
 *
 *	@return
 */
- (NSString *)qd_avatarImageSize35;

/**
 *	@brief	返回头像尺寸为30pt
 *
 *	@return
 */
- (NSString *)qd_avatarImageSize30;

- (NSString *)ym_commentImage;
@end
