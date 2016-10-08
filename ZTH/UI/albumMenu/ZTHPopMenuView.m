//
//  ZTHPopMenuView.m
//  ZTH
//
//  Created by yzl on 16/8/31.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHPopMenuView.h"
#import "ZTHPopMenuItemInfo.h"
#import "ZTHPopMenuButton.h"
#import <POP.h>
#import "UIImage+ImageEffects.h"
#define kW [UIScreen mainScreen].bounds.size.width
#define kH [UIScreen mainScreen].bounds.size.height
#define COLUMN_NUM 3
@interface ZTHPopMenuView ()<UIGestureRecognizerDelegate>
/*
 * name
 */
@property (strong,nonatomic) NSMutableArray* items;
/*
 * name
 */
@property (strong,nonatomic) NSMutableArray* buttons;
/*
 * 关闭按钮
 */
@property (strong,nonatomic) UIButton* closeButton;
/*
 * name
 */
@property (strong,nonatomic) UIImageView* backgroundImageView;
/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief Description
 */
@property (copy, nonatomic) void(^buttonActionBlock)(NSInteger buttonIndex);
/*
 * name
 */
@property (strong,nonatomic) UITapGestureRecognizer* tapGst;
@end
@implementation ZTHPopMenuView
- (instancetype)initWithMenuItems:(NSMutableArray*)items buttonAction:(void(^)(NSInteger buttonIndex))buttonAction{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.items = [items mutableCopy];
        self.buttonActionBlock = buttonAction;
        [self initUI];
       
    }
    return self;
}


- (void)initUI{
    [self addSubview:self.backgroundImageView];
    [self.buttons removeAllObjects];
    [self.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat buttonViewWidth = MIN(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) / 3;
        buttonViewWidth = buttonViewWidth - 10;
        ZTHPopMenuButton* button = [[ZTHPopMenuButton alloc]initWithFrame: CGRectMake(0, 0, buttonViewWidth, buttonViewWidth)];
        button.exclusiveTouch = YES;
        [button setTitleColor:UIColorFromRGBV(0x333333) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = idx;
//        button.backgroundColor = [UIColor redColor];
        [self.buttons addObject:button];
        [self addSubview:button];
    }];
    
    [self addSubview:self.closeButton];
    self.closeButton.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, self.closeButton.center.y);
}

- (CGRect)getFrameAtIndex:(NSUInteger)index;
{
    CGFloat buttonViewWidth = MIN(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) / COLUMN_NUM;
    CGFloat buttonViewHeight = (buttonViewWidth - 10);
    CGFloat margin = (self.frame.size.width - COLUMN_NUM * buttonViewWidth) / (COLUMN_NUM + 1);
    NSInteger colnumIndex = index % COLUMN_NUM;
    NSInteger rowIndex = index / COLUMN_NUM;
    NSUInteger toRows = (self.items.count / COLUMN_NUM);
    
    CGFloat toHeight = toRows * buttonViewHeight;
    
    CGFloat buttonViewX = (colnumIndex + 1) * margin + colnumIndex * buttonViewWidth;
    CGFloat buttonViewY = ((rowIndex + 1) * margin + rowIndex * buttonViewHeight) + (kH - toHeight) - 250;
    CGRect rect = CGRectMake(buttonViewX, buttonViewY, buttonViewWidth, buttonViewHeight);
    return rect;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (touch.view == self) {
        return YES;
    }
    return NO;
}

#pragma mark - setter & getter

- (NSMutableArray*)items{
    if (!_items) {
        _items = [[NSMutableArray alloc]init];
    }
    return _items;
}

- (NSMutableArray*)buttons{
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc]init];
    }
    return _buttons;
}

- (UIButton*)closeButton{
    if (!_closeButton) {
        CGFloat buttonViewWidth = MIN(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) / COLUMN_NUM;
        _closeButton = [[UIButton alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.frame)- buttonViewWidth)/2.0, (CGRectGetHeight(self.frame) - buttonViewWidth), buttonViewWidth, buttonViewWidth)];
        [_closeButton setImage:[UIImage imageNamed:@"album_menu_icon_close_selected"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UIImageView*)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        UIImage* image = [self screenView];
        if (image) {
            UIImage* bluerImage = [image applyBlurWithRadius:15 tintColor:[UIColor colorWithWhite:1.000 alpha:0.570] saturationDeltaFactor:1.8 maskImage:nil];
            _backgroundImageView.image = bluerImage;
        }
    }
    return _backgroundImageView;
}

- (UITapGestureRecognizer*)tapGst{
    if (!_tapGst) {
        _tapGst = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    }
    return _tapGst;
}

#pragma mark - response method
- (void)buttonAction:(ZTHPopMenuButton*)sender{
    [self hide];
    if (self.buttonActionBlock) {
        self.buttonActionBlock(sender.tag);
    }
}

#pragma mark - method

- (void)show{
    self.alpha = 1.0;
    UIImage* image = [self screenView];
    if (image) {
        UIImage* bluerImage = [image applyBlurWithRadius:15 tintColor:[UIColor colorWithWhite:1.000 alpha:0.570] saturationDeltaFactor:1.8 maskImage:nil];
        self.backgroundImageView.image = bluerImage;
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [self addSubview:self.closeButton];
    kWeakSelf;
    [self.buttons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        kStrongSelf;
        ZTHPopMenuButton* button = obj;
        ZTHPopMenuItemInfo* itemInfo = [self.items objectAtIndex:idx];
        [button setImage:[UIImage imageNamed:itemInfo.imageName] forState:UIControlStateNormal];
        [button setTitle:itemInfo.title forState:UIControlStateNormal];

        CGRect toRect;
        CGRect fromRect;
        double dy = idx * 0.035f;

        toRect = [self getFrameAtIndex:idx];
        fromRect = self.closeButton.frame;
        fromRect.size.height = fromRect.size.width - 10;
        kWeakSelf;
        [self showAnimateWithFromRect:fromRect toRect:toRect delay:dy View:button hide:NO completeBlock:^{
            kStrongSelf;
            if (idx == self.items.count - 1) {
                [self addGestureRecognizer:self.tapGst];
            }
        }];
        
      
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.closeButton.transform = CGAffineTransformMakeRotation(M_PI) ;
    }];
 
}

- (void)hide{
    [self.buttons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ZTHPopMenuButton* button = obj;
        double d = self.items.count * 0.04;
        double dy = d - idx * 0.04;
        CFTimeInterval delay = dy + CACurrentMediaTime();
        
        CGRect toRect;
        CGRect fromRect;
        
        fromRect = [self getFrameAtIndex:idx];
        toRect = self.closeButton.frame;
        toRect.size.height = fromRect.size.width - 10;

        [self showAnimateWithFromRect:fromRect toRect:toRect delay:delay View:button hide:YES completeBlock:^{
            
        }];
        
        
    }];
    [UIView animateWithDuration:0.3 animations:^{
        self.closeButton.transform = CGAffineTransformMakeRotation(0);
    }];
    double d = (self.items.count * 0.04) + 0.3;

    [UIView animateKeyframesWithDuration:0.2
                                   delay:d
                                 options:0
                              animations:^{
                                  self.alpha = 0.0;
                              }
                              completion:^(BOOL finished) {
                                  [self removeFromSuperview];
                                  [self removeGestureRecognizer:self.tapGst];
                              }];

}
- (void)showAnimateWithFromRect:(CGRect)fromRect toRect:(CGRect)toRect delay:(NSTimeInterval)delay View:(UIView*)view hide:(BOOL)isHide completeBlock:(void(^)(void))completeBlock{
    CGFloat toV, fromV;
    CGFloat springBounciness = 12.f;
    toV = !isHide;
    fromV = isHide;
    if (isHide) {
        POPBasicAnimation* basicAnimationCenter = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        basicAnimationCenter.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(toRect), CGRectGetMidY(toRect))];
        basicAnimationCenter.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(fromRect), CGRectGetMidY(fromRect))];
        basicAnimationCenter.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        basicAnimationCenter.beginTime = delay;
        basicAnimationCenter.duration = 0.18;
        [view pop_addAnimation:basicAnimationCenter forKey:basicAnimationCenter.name];
        
        POPBasicAnimation* basicAnimationScale = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleX];
        basicAnimationScale.removedOnCompletion = YES;
        basicAnimationScale.beginTime = delay;
        basicAnimationScale.toValue = @(0.7);
        basicAnimationScale.fromValue = @(1);
        basicAnimationScale.duration = 0.18;
        basicAnimationScale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [view.layer pop_addAnimation:basicAnimationScale forKey:basicAnimationScale.name];
        
        
        POPBasicAnimation* basicAnimationScale2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleY];
        basicAnimationScale2.beginTime = delay;
        basicAnimationScale2.toValue = @(0.7);
        basicAnimationScale2.fromValue = @(1);
        basicAnimationScale2.duration = 0.18f;
        basicAnimationScale2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [view.layer pop_addAnimation:basicAnimationScale2 forKey:basicAnimationScale2.name];

        
        POPBasicAnimation* basicAnimationAlpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basicAnimationAlpha.removedOnCompletion = YES;
        basicAnimationAlpha.duration = 0.3f;
        basicAnimationAlpha.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        basicAnimationAlpha.beginTime = delay;
        basicAnimationAlpha.toValue = @(0);
        basicAnimationAlpha.fromValue = @(1);
        [view pop_addAnimation:basicAnimationAlpha forKey:basicAnimationAlpha.name];

    }
    else {
        POPSpringAnimation* basicAnimationCenter = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        basicAnimationCenter.beginTime = delay;
        basicAnimationCenter.springSpeed = 10;
        basicAnimationCenter.springBounciness = springBounciness;
        basicAnimationCenter.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(toRect), CGRectGetMidY(toRect))];
        basicAnimationCenter.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(fromRect), CGRectGetMidY(fromRect))];
        
        POPBasicAnimation* basicAnimationScale = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleX];
        basicAnimationScale.beginTime = delay;
        basicAnimationScale.toValue = @(1);
        basicAnimationScale.fromValue = @(0.7);
        basicAnimationScale.duration = 0.3f;
        basicAnimationScale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [view.layer pop_addAnimation:basicAnimationScale forKey:basicAnimationScale.name];
        
        POPBasicAnimation* basicAnimationScale2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleY];
        basicAnimationScale2.beginTime = delay;
        basicAnimationScale2.toValue = @(1);
        basicAnimationScale2.fromValue = @(0.7);
        basicAnimationScale2.duration = 0.3f;
        basicAnimationScale2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [view.layer pop_addAnimation:basicAnimationScale2 forKey:basicAnimationScale2.name];

        
        POPBasicAnimation* basicAnimationAlpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
        basicAnimationAlpha.removedOnCompletion = YES;
        basicAnimationAlpha.duration = 0.1f;
        basicAnimationAlpha.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        basicAnimationAlpha.beginTime = delay;
        basicAnimationAlpha.toValue = @(toV);
        basicAnimationAlpha.fromValue = @(fromV);
        
        [view pop_addAnimation:basicAnimationAlpha forKey:basicAnimationAlpha.name];
        [view pop_addAnimation:basicAnimationCenter forKey:basicAnimationCenter.name];
        [basicAnimationCenter setCompletionBlock:^(POPAnimation* spring, BOOL Completion) {
            if (Completion && completeBlock) {
                completeBlock();
            }
        }];
    }

}

- (UIImage*)screenView{
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    
    UIGraphicsBeginImageContext(screenWindow.frame.size);
    
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return viewImage;
}


@end
