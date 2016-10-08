//
//  UIButton+QDWebCache.h
//  LMQD
//
//  Created by min zhang on 15/10/11.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"

/**
 *	@brief	扩展SDWebImage的方法，如果不是缓存的图片加入渐变动画
 */
@interface UIButton (QDWebCache)

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state;

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_cancelBackgroundImageLoad;

@end
