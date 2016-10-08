//
//  UIColor+QDImage.m
//  LMQD
//
//  Created by min zhang on 15/10/9.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "UIColor+QDImage.h"

@implementation UIColor (QDImage)

- (UIImage *)qd_imageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, (CGRect){.size=size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)qd_image
{
    return [self qd_imageWithSize:(CGSize){.width=1.0, .height=1.0}];
}

@end
