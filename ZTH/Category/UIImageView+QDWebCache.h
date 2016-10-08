//
//  UIImageView+QDWebCacheAnimation.h
//  LMQD
//
//  Created by 阮景雄 on 15/9/12.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImageCompat.h>
#import <SDWebImage/SDWebImageManager.h>

@interface UIImageView (QDWebCache)

- (void)qd_setImageAnimatedWithURL:(NSURL *)url;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;

- (void)qd_cancelCurrentImageLoad;

- (void)qd_cancelCurrentAnimationImagesLoad;

@end
