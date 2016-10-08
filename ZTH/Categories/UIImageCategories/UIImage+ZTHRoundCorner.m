//
//  UIImage+ZTHRoundCorner.m
//  ZTH
//
//  Created by yzl on 16/6/8.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "UIImage+ZTHRoundCorner.h"
#import "UIImage+ZTHAlpha.h"
@implementation UIImage (ZTHRoundCorner)
- (UIImage *)zth_applyRoundedCorners
{
    CGFloat scale = self.scale;
    NSInteger size = MIN(self.size.width * scale/2, self.size.height * scale/2);
    UIImage *output = [self roundedCornerImage:size borderSize:1];
    return output;
}

- (UIImage *)zth_applyCornerRadius:(CGFloat)radius
{
    UIImage *output = [self roundedCornerImage:radius borderSize:1];
    return output;
}

- (UIImage *)zth_applyRoundedCornerWithBorderColor:(UIColor *)color borderSize:(NSInteger)borderSize
{
    // 添加透明图片
    UIImage * image = [self zth_imageWithAlpha];
    // 图片大小
    CGSize size = CGSizeMake(image.size.width + borderSize, image.size.height + borderSize);
    
    //创建图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, image.scale);
    
    //绘制边框的圆
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    
    //剪切可视范围
    CGContextClip(context);
    
    //绘制边框图片
    UIColor *borderColor = color;//[UIColor colorWithRed:0.157 green:0.027 blue:0.059 alpha:0.800];
    CGContextSetFillColorWithColor(context, borderColor.CGColor);
    CGContextFillRect(context, (CGRect){.size=size});
    
    //设置头像frame
    CGFloat iconX = borderSize / 2;
    CGFloat iconY = borderSize / 2;
    CGFloat iconW = image.size.width;
    CGFloat iconH = image.size.height;
    
    //绘制圆形头像范围
    CGContextAddEllipseInRect(context, CGRectMake(iconX, iconY, iconW, iconH));
    
    //剪切可视范围
    CGContextClip(context);
    
    //绘制头像
    [image drawInRect:CGRectMake(iconX, iconY, iconW, iconH)];
    
    //取出整个图片上下文的图片
    UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return iconImage;
}


// Creates a copy of this image with rounded corners
// If borderSize is non-zero, a transparent border of the given size will also be added
// Original author: Bj枚rn S氓llarp. Used with permission. See: http://blog.sallarp.com/iphone-uiimage-round-corners/
- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize {
    // If the image does not have an alpha layer, add one
    UIImage *image = [self zth_imageWithAlpha];
    
    CGFloat scale = self.scale;
    CGFloat width = image.size.width * scale;
    CGFloat height = image.size.height * scale;
    // Build a context that's the same dimensions as the new size
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 width,
                                                 height,
                                                 CGImageGetBitsPerComponent(image.CGImage),
                                                 0,
                                                 CGImageGetColorSpace(image.CGImage),
                                                 CGImageGetBitmapInfo(image.CGImage));
    
    // Create a clipping path with rounded corners
    CGContextBeginPath(context);
    [self addRoundedRectToPath:CGRectMake(borderSize, borderSize, width - borderSize * 2, height - borderSize * 2)
                       context:context
                     ovalWidth:cornerSize
                    ovalHeight:cornerSize];
    CGContextClosePath(context);
    CGContextClip(context);
    
    // Draw the image to the context; the clipping path will make anything outside the rounded rect transparent
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image.CGImage);
    
    // Create a CGImage from the context
    CGImageRef clippedImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    // Create a UIImage from the CGImage
    UIImage *roundedImage = [UIImage imageWithCGImage:clippedImage scale:image.scale orientation:UIImageOrientationUp];
    CGImageRelease(clippedImage);
    
    return roundedImage;
}

#pragma mark -
#pragma mark Private helper methods

// Adds a rectangular path to the given context and rounds its corners by the given extents
// Original author: Bj枚rn S氓llarp. Used with permission. See: http://blog.sallarp.com/iphone-uiimage-round-corners/
- (void)addRoundedRectToPath:(CGRect)rect context:(CGContextRef)context ovalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight {
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    CGFloat fw = CGRectGetWidth(rect) / ovalWidth;
    CGFloat fh = CGRectGetHeight(rect) / ovalHeight;
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

@end
