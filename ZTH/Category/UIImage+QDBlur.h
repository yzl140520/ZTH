//
//  UIImage+QDBlur.h
//  LMQD
//
//  Created by min zhang on 15/10/13.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QDBlur)

- (UIImage *)qd_applyLightEffect;

- (UIImage *)qd_applyExtraLightEffect;

- (UIImage *)qd_applyWhiteLightEffect;

- (UIImage *)qd_applyDarkEffect;

- (UIImage *)qd_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
