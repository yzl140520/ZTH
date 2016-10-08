//
//  UIImageView+QDWebCacheAnimation.m
//  LMQD
//
//  Created by 阮景雄 on 15/9/12.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import "UIImageView+QDWebCache.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (QDWebCache)

- (void)qd_setImageAnimatedWithURL:(NSURL *)url
{
    [self qd_setImageAnimatedWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self qd_setImageAnimatedWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    [self qd_setImageAnimatedWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock
{
    [self qd_setImageAnimatedWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self qd_setImageAnimatedWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock
{
    [self qd_setImageAnimatedWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock
{
    WEAKSELF_T weakSelf = self;
    [self sd_setImageWithURL:url placeholderImage:placeholder options:(options | SDWebImageRetryFailed) progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (cacheType == SDImageCacheTypeNone && image) {
            CATransition *transition = createTransitionAnimation();
            [weakSelf.layer addAnimation:transition forKey:nil];
        }
        
        if (completedBlock) {
            completedBlock(image, error, cacheType, imageURL);
        }
    }];
}

- (void)qd_cancelCurrentImageLoad
{
    [self sd_cancelCurrentImageLoad];
}

- (void)qd_cancelCurrentAnimationImagesLoad
{
    [self sd_cancelCurrentAnimationImagesLoad];
}

@end
