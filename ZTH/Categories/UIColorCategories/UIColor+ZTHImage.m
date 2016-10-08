//
//  UIColor+ZTHImage.m
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "UIColor+ZTHImage.h"

@implementation UIColor (ZTHImage)
- (UIImage *)zth_imageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, (CGRect){.size=size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)zth_image
{
    return [self zth_imageWithSize:(CGSize){.width=1.0, .height=1.0}];
}
@end
