//
//  ZTHPopMenuButton.m
//  ZTH
//
//  Created by yzl on 16/8/31.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHPopMenuButton.h"
#import "UIColor+ImageGetColor.h"
static NSString* animationKey = @"transform.scale";

@implementation ZTHPopMenuButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.titleLabel.alpha = 0.0f;
        //1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        //3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.clipsToBounds = true;
        //4.取消高亮
//        self.adjustsImageWhenHighlighted = false;
        self.titleLabel.textColor = UIColorFromRGBV(0x333333);
        
//        [self addTarget:self action:@selector(scaleToSmall)
//       forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
//        [self addTarget:self action:@selector(scaleToDefault)
//       forControlEvents:UIControlEventTouchDragExit];

    }
    return self;
}
 #pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWidth = contentRect.size.width / 1.7;
    CGFloat imageX = CGRectGetWidth(contentRect) / 2 - imageWidth / 2;
    CGFloat imageHeight = imageWidth;
    CGFloat imageY = CGRectGetHeight(self.bounds) - (imageHeight + 30);
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

    #pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleHeight = 20;
    CGFloat titleY = contentRect.size.height - titleHeight;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

//- (void)scaleToSmall
//{
//    CABasicAnimation* theAnimation;
//    theAnimation = [CABasicAnimation animationWithKeyPath:animationKey];
//    theAnimation.delegate = self;
//    theAnimation.duration = 0.1;
//    theAnimation.repeatCount = 0;
//    theAnimation.removedOnCompletion = FALSE;
//    theAnimation.fillMode = kCAFillModeForwards;
//    theAnimation.autoreverses = NO;
//    theAnimation.fromValue = [NSNumber numberWithFloat:1];
//    theAnimation.toValue = [NSNumber numberWithFloat:1.2f];
//    [self.imageView.layer addAnimation:theAnimation forKey:theAnimation.keyPath];
//}
//
//- (void)scaleToDefault
//{
//    CABasicAnimation* theAnimation;
//    theAnimation = [CABasicAnimation animationWithKeyPath:animationKey];
//    theAnimation.delegate = self;
//    theAnimation.duration = 0.1;
//    theAnimation.repeatCount = 0;
//    theAnimation.removedOnCompletion = FALSE;
//    theAnimation.fillMode = kCAFillModeForwards;
//    theAnimation.autoreverses = NO;
//    theAnimation.fromValue = [NSNumber numberWithFloat:1.2f];
//    theAnimation.toValue = [NSNumber numberWithFloat:1];
//    [self.imageView.layer addAnimation:theAnimation forKey:theAnimation.keyPath];
//}


- (void)selectdAnimation
{
    self.userInteractionEnabled = false;
    self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
    UIImage* image = self.imageView.image;
    UIColor* color = [UIColor getPixelColorAtLocation:CGPointMake(50, 20) inImage:image];
    [self setBackgroundColor:color];
//    if (_model.transitionRenderingColor) {
//        [self setBackgroundColor:_model.transitionRenderingColor];
//    }
    UILabel* textLabel = [self viewWithTag:21];
    textLabel.text = @"";
    [self setTitle:@"" forState:UIControlStateNormal];
    [self setImage:nil forState:UIControlStateNormal];
    
    CABasicAnimation* expandAnim = [CABasicAnimation animationWithKeyPath:animationKey];
    expandAnim.fromValue = @(1.0);
    expandAnim.toValue = @(33.0);
    expandAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.95:0.02:1:0.05];
    expandAnim.duration = 0.3;
    expandAnim.delegate = self;
    expandAnim.fillMode = kCAFillModeForwards;
    expandAnim.removedOnCompletion = false;
    expandAnim.autoreverses = NO;
    [self.layer addAnimation:expandAnim forKey:expandAnim.keyPath];
}

- (void)cancelAnimation
{
    
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:animationKey];
    scaleAnimation.delegate = self;
    scaleAnimation.duration = 0.2;
    scaleAnimation.repeatCount = 0;
    scaleAnimation.removedOnCompletion = FALSE;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fromValue = @1;
    scaleAnimation.toValue = @0.3;
    
    CABasicAnimation* opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.delegate = self;
    opacityAnimation.duration = 0.2;
    opacityAnimation.repeatCount = 0;
    opacityAnimation.removedOnCompletion = FALSE;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.autoreverses = NO;
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
    //CGAffineTransformIdentity
    [self.layer addAnimation:scaleAnimation forKey:[NSString stringWithFormat:@"cancel%@", scaleAnimation.keyPath]];
    [self.layer addAnimation:opacityAnimation forKey:opacityAnimation.keyPath];
}

@end
