//
//  RLJellyAnimationView.m
//  YZLJellyAnimation
//
//  Created by yzl on 16/1/8.
//  Copyright © 2016年 yzl. All rights reserved.
//

#import "RLJellyAnimationView.h"
#define SYS_DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SYS_DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
#define MIN_HEIGHT          100                                                          // 图形最小高度
static NSString* kControlPointX = @"o_contolPointX";
static NSString* kControlPointY = @"o_controlPointY";
@interface RLJellyAnimationView()
@property (strong, nonatomic) CAShapeLayer* o_shapeLayer;
@property (strong, nonatomic) CADisplayLink* o_displayLink;
@property (strong, nonatomic) UIView* o_controlView; //控制点
@property (assign, nonatomic) CGFloat o_contolPointX; //控制点x坐标
@property (assign, nonatomic) CGFloat o_controlPointY;//控制点y坐标
@end
@implementation RLJellyAnimationView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver:self forKeyPath:kControlPointX options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:kControlPointY options:NSKeyValueObservingOptionNew context:nil];
        [self initDisplayLink];
        
        [self initShapeLayer];
        UIPanGestureRecognizer* panGst = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGst:)];
        [self addGestureRecognizer:panGst];
        
        [self initControlView];
    }
    return self;
}
- (void)dealloc{
    [self removeObserver:self forKeyPath:kControlPointX];
    [self removeObserver:self forKeyPath:kControlPointY];
}
#pragma mark - response method
- (void)calculateControlPoint{
    CALayer* layer = self.o_controlView.layer.presentationLayer;
    self.o_contolPointX = layer.position.x;
    self.o_controlPointY = layer.position.y;
    NSLog(@"%f,%f",self.o_contolPointX,self.o_controlPointY);

}
- (void)panGst:(UIPanGestureRecognizer*)panGstRec{
    if (panGstRec.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [panGstRec translationInView:self];
        CGFloat tempHeight = point.y*0.7 + MIN_HEIGHT;
        self.o_contolPointX = SYS_DEVICE_WIDTH/2.0 + point.x;
        self.o_controlPointY = tempHeight > MIN_HEIGHT ? tempHeight : MIN_HEIGHT;
        self.o_controlPointY = point.y < MIN_HEIGHT ? MIN_HEIGHT :point.y;
        [self.o_controlView setFrame:CGRectMake(self.o_contolPointX, self.o_controlPointY, 3, 3)];
    }else if (panGstRec.state == UIGestureRecognizerStateCancelled ||
              panGstRec.state == UIGestureRecognizerStateEnded ||
              panGstRec.state == UIGestureRecognizerStateFailed){
        self.o_displayLink.paused = NO;
        [UIView animateWithDuration:0.54
                              delay:0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                [self.o_controlView setFrame:CGRectMake(SYS_DEVICE_WIDTH/2.0, MIN_HEIGHT, 3, 3)];
        } completion:^(BOOL finished) {
            if(finished)
            {
                self.o_displayLink.paused = YES;
            }
        }];
    }
}
#pragma mark - pravite method
- (void)initControlView{
    self.o_contolPointX = SYS_DEVICE_WIDTH/2.0;
    self.o_controlPointY = MIN_HEIGHT;
    _o_controlView = [[UIView alloc]initWithFrame:CGRectMake(SYS_DEVICE_WIDTH/2.0, MIN_HEIGHT, 3, 3)];
    _o_controlView.backgroundColor = [UIColor redColor];
    [self addSubview:self.o_controlView];

}
- (void)initDisplayLink{
    _o_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(calculateControlPoint)];
    [_o_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    _o_displayLink.paused = YES;
}
- (void)initShapeLayer{
    _o_shapeLayer = [CAShapeLayer layer];
    _o_shapeLayer.fillColor = [[UIColor colorWithRed:1.000 green:0.635 blue:0.038 alpha:1.000]CGColor];
    [self.layer addSublayer:self.o_shapeLayer];
}
- (void)updateShapeLayerPath{
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(SYS_DEVICE_WIDTH, 0)];
    [path addLineToPoint:CGPointMake(SYS_DEVICE_WIDTH, MIN_HEIGHT)];
    [path addQuadCurveToPoint:CGPointMake(0, MIN_HEIGHT) controlPoint:CGPointMake(self.o_contolPointX, self.o_controlPointY)];
    [path closePath];
    self.o_shapeLayer.path = path.CGPath;
    
}
#pragma mark - observer
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context{
    if ([keyPath isEqualToString:kControlPointY] || [keyPath isEqualToString:kControlPointX]) {
        [self updateShapeLayerPath];
    }
    
}
@end
