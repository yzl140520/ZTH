//
//  NSURL+QDAdditions.h
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (QDAdditions)

/**
 *  用于 SDWebimage 请求后，指定缓存的图片是否处理成为圆形或圆角的。
 *  具体解析方式可以查看 MTWebImageManagerDelegateObject 类
 */
- (NSURL *)qd_appendRound;

/**
 *  用于SDWebImage 请求后，指定缓存的图片是否处理成圆形带描边的。
 */
- (NSURL *)qd_appendRoundBorder;

/**
 *  用于 SDWebimage 请求后，指定缓存的图片处理成为圆角的。
 *
 *  @param radius 圆角半径，这个半径是指在 inSize 中的半径值
 *  @param inSize 表示图片显示的尺寸
 *  @param contentMode 目标视图的 content mode
 *
 *  @discussion 圆角不能简单应用在 UIImage 上，而是需要考虑 UIImage 显示在什么尺寸的 UIImageView 中
 *  @return 处理后的图片
 */
- (NSURL *)qd_appendWithRadius:(CGFloat)radius inSize:(CGSize)inSize contentMode:(UIViewContentMode)contentMode;

- (NSURL *)qd_appendQueryParams:(NSDictionary *)queryParams;

/**
 *  获取 URL 中的属性列表
 */
- (NSDictionary *)qd_queryItems;

@end
