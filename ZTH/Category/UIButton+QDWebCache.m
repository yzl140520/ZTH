//
//  UIButton+QDWebCache.m
//  LMQD
//
//  Created by min zhang on 15/10/11.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "UIButton+QDWebCache.h"
#import "UIButton+WebCache.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton (QDWebCache)

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state
{
    [self qd_setImageAnimatedWithURL:url forState:state placeholderImage:nil options:0 completed:nil];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder
{
    [self qd_setImageAnimatedWithURL:url forState:state placeholderImage:placeholder options:0 completed:nil];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    [self qd_setImageAnimatedWithURL:url forState:state placeholderImage:placeholder options:options completed:nil];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock
{
    [self qd_setImageAnimatedWithURL:url forState:state placeholderImage:nil options:0 completed:completedBlock];
}
- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self qd_setImageAnimatedWithURL:url forState:state placeholderImage:placeholder options:0 completed:completedBlock];
}

- (void)qd_setImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock
{
    WEAKSELF_T weakSelf = self;
    [weakSelf.layer removeAnimationForKey:@"SD_Transition"];
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:(options | SDWebImageRetryFailed) completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (cacheType == SDImageCacheTypeNone) {
            CATransition *transition = createTransitionAnimation();
            transition.duration      = .5f;
            
            [weakSelf.layer addAnimation:transition forKey:@"SD_Transition"];
        }
        
        if (completedBlock) {
            completedBlock(image, error, cacheType, imageURL);
        }
    }];
}

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state
{
    [self qd_setBackgroundImageAnimatedWithURL:url forState:state placeholderImage:nil options:0 completed:nil];
}

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder
{
    [self qd_setBackgroundImageAnimatedWithURL:url forState:state placeholderImage:placeholder options:0 completed:nil];
}

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    [self qd_setBackgroundImageAnimatedWithURL:url forState:state placeholderImage:placeholder options:options completed:nil];
}

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock
{
    [self qd_setBackgroundImageAnimatedWithURL:url forState:state placeholderImage:nil options:0 completed:completedBlock];
}

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self qd_setBackgroundImageAnimatedWithURL:url forState:state placeholderImage:placeholder options:0 completed:completedBlock];
}

- (void)qd_setBackgroundImageAnimatedWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock
{
    WEAKSELF_T weakSelf = self;
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:(options | SDWebImageRetryFailed) completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (cacheType == SDImageCacheTypeNone && image) {
            CATransition *transition = createTransitionAnimation();
            transition.duration      = .5f;
            
            [weakSelf.layer addAnimation:transition forKey:nil];
        }
        
        if (completedBlock) {
            completedBlock(image, error, cacheType, imageURL);
        }
    }];
}

- (void)qd_cancelBackgroundImageLoad
{
    [self sd_cancelBackgroundImageLoadForState:UIControlStateNormal];
}

@end
