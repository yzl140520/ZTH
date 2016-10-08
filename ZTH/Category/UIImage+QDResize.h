//
//  UIImage+QDResize.h
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QDResize)

// 粗体兼容图片
+ (UIImage *)qd_compatibleImageWithName:(NSString *)name;

// 拉伸图片获取
+ (UIImage *)qd_resizableImageWithName:(NSString *)name;

+ (UIImage *)qd_resizableImageWithName:(NSString *)name leftFactor:(CGFloat)leftFactor topFactor:(CGFloat)topFactor;

+ (UIImage *)qd_resizableImageWithName:(NSString *)name leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset;


- (UIImage *)qd_fixOrientation;

- (UIImage *)qd_maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

+ (UIImage *)qd_blendImage:(UIImage *)image withCoverImage:(UIImage *)coverImage;

+ (UIImage *)qd_blendImage:(UIImage *)image withCoverImage:(UIImage *)coverImage withSize:(CGSize)size;

+ (UIImage *)qd_blendImage:(UIImage *)image withSize:(CGSize)size withCoverImage:(UIImage *)coverImage withCoverImageSize:(CGSize)coverImageSize;

+ (UIImage *)qd_blendImage:(UIImage *)image withSize:(CGSize)size withCoverImage:(UIImage *)coverImage withCoverImageSize:(CGSize)coverImageSize scale:(CGFloat) scale;

- (UIImage *)qd_croppedImage:(CGRect)bounds;

-(UIImage *)qd_makeRoundedImage:(UIImage *)image
                      radius:(CGFloat)radius;

#pragma mark - 修改图片尺寸

// Returns a rescaled copy of the image, taking into account its orientation
// The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
- (UIImage *)qd_resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

// Resizes the image according to the given content mode, taking into account the image's orientation
- (UIImage *)qd_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                     bounds:(CGSize)bounds
                       interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)ym_imageWithAspectFillSize:(CGSize)size;

@end
