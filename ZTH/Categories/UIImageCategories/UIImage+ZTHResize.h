//
//  UIImage+ZTHResize.h
//  ZTH
//
//  Created by yzl on 16/6/8.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZTHResize)
// 粗体兼容图片
+ (UIImage *)zth_compatibleImageWithName:(NSString *)name;

// 拉伸图片获取
+ (UIImage *)zth_resizableImageWithName:(NSString *)name;

+ (UIImage *)zth_resizableImageWithName:(NSString *)name leftFactor:(CGFloat)leftFactor topFactor:(CGFloat)topFactor;

+ (UIImage *)zth_resizableImageWithName:(NSString *)name leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset;


- (UIImage *)zth_fixOrientation;

- (UIImage *)zth_maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

+ (UIImage *)zth_blendImage:(UIImage *)image withCoverImage:(UIImage *)coverImage;

+ (UIImage *)zth_blendImage:(UIImage *)image withCoverImage:(UIImage *)coverImage withSize:(CGSize)size;

+ (UIImage *)zth_blendImage:(UIImage *)image withSize:(CGSize)size withCoverImage:(UIImage *)coverImage withCoverImageSize:(CGSize)coverImageSize;

+ (UIImage *)zth_blendImage:(UIImage *)image withSize:(CGSize)size withCoverImage:(UIImage *)coverImage withCoverImageSize:(CGSize)coverImageSize scale:(CGFloat) scale;

- (UIImage *)zth_croppedImage:(CGRect)bounds;

-(UIImage *)zth_makeRoundedImage:(UIImage *)image
                         radius:(CGFloat)radius;

#pragma mark - 修改图片尺寸

// Returns a rescaled copy of the image, taking into account its orientation
// The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
- (UIImage *)zth_resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

// Resizes the image according to the given content mode, taking into account the image's orientation
- (UIImage *)zth_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                     bounds:(CGSize)bounds
                       interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)zth_imageWithAspectFillSize:(CGSize)size;
@end
