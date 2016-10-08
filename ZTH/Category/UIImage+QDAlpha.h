//
//  UIImage+QDAlpha.h
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QDAlpha)

- (BOOL)qd_hasAlpha;
- (UIImage *)qd_imageWithAlpha;
- (UIImage *)qd_transparentBorderImage:(NSUInteger)borderSize;

@end
