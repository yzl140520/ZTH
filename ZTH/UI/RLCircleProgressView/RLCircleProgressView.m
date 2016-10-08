//
//  YZLProgressView.m
//  YZLProgressView
//
//  Created by yzl on 16/1/9.
//  Copyright © 2016年 yzl. All rights reserved.
//

#import "RLCircleProgressView.h"
#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define  PROGREESS_WIDTH 80 //圆直径
#define PROGRESS_LINE_WIDTH 4 //弧线的宽度
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface RLCircleProgressView()
@property (strong, nonatomic) CAShapeLayer* o_shapeLayer;
@property (strong, nonatomic) CAGradientLayer* o_gradientLayer;
@property (strong, nonatomic) CAShapeLayer* o_trackLayer;
@end
@implementation RLCircleProgressView
- (instancetype)initWithFrame:(CGRect)frame{
    frame.size.height = PROGREESS_WIDTH + 10;
    frame.size.width  = PROGREESS_WIDTH + 10;
    self = [super initWithFrame:frame];
    if (self) {
        [self initTrackLayer];
        [self initShapeLayer];
        [self initGradientLayer];
        [self.o_gradientLayer setMask:self.o_shapeLayer];
    }
    return self;
}
- (void)initTrackLayer{
    _o_trackLayer = [CAShapeLayer layer];
    _o_trackLayer = [CAShapeLayer layer];
    _o_trackLayer.lineWidth = PROGRESS_LINE_WIDTH;
    _o_trackLayer.lineCap = kCALineCapRound;
    _o_trackLayer.fillColor =  [[UIColor clearColor] CGColor];
    _o_trackLayer.strokeColor  = [[UIColor lightGrayColor] CGColor];
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:self.center radius:PROGREESS_WIDTH/2.0 startAngle:degreesToRadians(0) endAngle:degreesToRadians(360) clockwise:YES];
    _o_trackLayer.path = [path CGPath];
    [self.layer addSublayer:self.o_trackLayer];
}
- (void)initShapeLayer{
    _o_shapeLayer = [CAShapeLayer layer];
    _o_shapeLayer.lineWidth = PROGRESS_LINE_WIDTH;
    _o_shapeLayer.lineCap = kCALineCapRound;
    _o_shapeLayer.fillColor =  [[UIColor clearColor] CGColor];
    _o_shapeLayer.strokeColor  = [[UIColor redColor] CGColor];
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:self.center radius:PROGREESS_WIDTH/2.0 startAngle:degreesToRadians(0) endAngle:degreesToRadians(360) clockwise:YES];
    _o_shapeLayer.strokeEnd = 0;
    _o_shapeLayer.path = [path CGPath];
    
}
- (void)initGradientLayer{
    CAGradientLayer* leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame));
    leftLayer.startPoint = CGPointMake(0.5, 1);
    leftLayer.endPoint   = CGPointMake(0.5, 0);
    leftLayer.locations  = @[@0.5,@0.9,@1];
    leftLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[UIColorFromRGB(0xfde802) CGColor], nil];
    
    CAGradientLayer* rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(CGRectGetWidth(self.frame)/2.0, 0,CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame));
    rightLayer.startPoint = CGPointMake(0.5, 0);
    rightLayer.endPoint   = CGPointMake(0.5, 1);
    rightLayer.locations  = @[@0.1,@0.5,@1];
    [rightLayer setColors:[NSArray arrayWithObjects:(id)[UIColorFromRGB(0xfde802) CGColor],(id)[[UIColor colorWithRed:0.157 green:0.502 blue:1.000 alpha:1.000] CGColor], nil]];
    
    _o_gradientLayer = [CAGradientLayer layer];
    [_o_gradientLayer addSublayer:leftLayer];
    [_o_gradientLayer addSublayer:rightLayer];
    [self.layer addSublayer:self.o_gradientLayer];
    
}
- (void)setProgress:(CGFloat)percent{
//    CABasicAnimation *strokeEndAnimation = nil;
//    strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    strokeEndAnimation.duration = 0.3;;
//    strokeEndAnimation.fromValue = @(self.o_shapeLayer.strokeEnd);
//    strokeEndAnimation.toValue = @(percent);
//    strokeEndAnimation.autoreverses = NO;
//    strokeEndAnimation.repeatCount = 0.f;
//    strokeEndAnimation.fillMode = kCAFillModeForwards;
//    strokeEndAnimation.removedOnCompletion = NO;
//    strokeEndAnimation.delegate = self;
//    [self.o_shapeLayer addAnimation:strokeEndAnimation forKey:@"strokeEndAnimation"];
//    [CATransaction begin];
//    [CATransaction setDisableActions:NO];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//    [CATransaction setAnimationDuration:0.5];
    self.o_shapeLayer.strokeEnd = percent;
//    [CATransaction commit];
    
    
}
@end
