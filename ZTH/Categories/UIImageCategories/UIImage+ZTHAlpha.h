//
//  UIImage+ZTHAlpha.h
//  ZTH
//
//  Created by yzl on 16/6/8.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZTHAlpha)
- (BOOL)zth_hasAlpha;
- (UIImage *)zth_imageWithAlpha;
- (UIImage *)zth_transparentBorderImage:(NSUInteger)borderSize;
@end
