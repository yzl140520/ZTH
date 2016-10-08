//
//  QDCustomizedPresentedControllerHelper.m
//  LMQD
//
//  Created by 阮景雄 on 15/9/28.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import "QDCustomizedPresentedControllerHelper.h"

const NSInteger QDCustomizedTransitionBackgroundViewTag        = 3994;
const NSTimeInterval QDCustomizedTransitionDefaultDuration     = 0.4f;

#pragma mark - QDCustomizedViewControllerPresentingAnimatedTransitioning

@interface QDCustomizedViewControllerPresentingAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) QDCustomTransitionType transitionType;
@property (nonatomic, assign) NSTimeInterval transitionDuration;

@end

@implementation QDCustomizedViewControllerPresentingAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *tempViewController = nil;
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                        UIViewAutoresizingFlexibleWidth |
                                        UIViewAutoresizingFlexibleRightMargin |
                                        UIViewAutoresizingFlexibleTopMargin |
                                        UIViewAutoresizingFlexibleHeight |
                                        UIViewAutoresizingFlexibleBottomMargin;
    backgroundView.backgroundColor = RGBA(0.f, 0.f, 0.f, 0.5f);
    backgroundView.alpha = 0.0f;
    backgroundView.tag = QDCustomizedTransitionBackgroundViewTag;
    
    if ([fromViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)fromViewController;
        tempViewController = tabBarController.selectedViewController;
        if ([tempViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)tempViewController;
            tempViewController = nav.topViewController;
        }
        
        [fromViewController.view addSubview:backgroundView];
    }
    else if ([fromViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)fromViewController;
        tempViewController = nav.topViewController;
        
        [fromViewController.view addSubview:backgroundView];
    }
    else {
        tempViewController = fromViewController;
        [tempViewController.view.window.rootViewController.view addSubview:backgroundView];
    }
    [tempViewController beginAppearanceTransition:NO animated:YES];
    
    // 计算开始、结束位置
    UIView *sourceView = [transitionContext containerView];
    UIView *popupView = toViewController.view;
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize  = toViewController.view.bounds.size;
    CGRect popupStartRect,popupEndRect;
    
    switch (self.transitionType) {
        case QDCustomTransitionTypeDropDown:
        {
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        -popupSize.height,
                                        popupSize.width,
                                        popupSize.height);
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      (sourceSize.height - popupSize.height) / 2,
                                        popupSize.width,
                                        popupSize.height);
        }
            break;
        case QDCustomTransitionTypePopUp:
        case QDCustomTransitionTypeDefault:
        default:
        {
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        sourceSize.height,
                                        popupSize.width,
                                        popupSize.height);
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      (sourceSize.height - popupSize.height) / 2,
                                      popupSize.width,
                                      popupSize.height);
        }
            break;
    }
    
    // 设置开始初始位置
    popupView.frame = popupStartRect;
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.83f initialSpringVelocity:0.3f options:UIViewAnimationOptionCurveEaseIn animations:^{
        popupView.frame = popupEndRect;
        backgroundView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        [tempViewController endAppearanceTransition];
    }];
}

@end

#pragma mark - Dismissing animated transitioning

@interface QDCustomizedViewControllerDismissingAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) QDCustomTransitionType transitionType;
@property (nonatomic, assign) NSTimeInterval transitionDuration;
@property (nonatomic, assign) BOOL bounce;

@end

@implementation QDCustomizedViewControllerDismissingAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *tempViewController = nil;
    
    UIView *backgroundView = nil;
    if ([toViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)toViewController;
        tempViewController = tabBarController.selectedViewController;
        if ([tempViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)tempViewController;
            tempViewController = nav.topViewController;
        }
        
        backgroundView = [toViewController.view viewWithTag:QDCustomizedTransitionBackgroundViewTag];
    }
    else if ([toViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)toViewController;
        tempViewController = nav.topViewController;
        
        backgroundView = [toViewController.view viewWithTag:QDCustomizedTransitionBackgroundViewTag];
    }
    else {
        tempViewController = toViewController;
        backgroundView = [tempViewController.view.window.rootViewController.view viewWithTag:QDCustomizedTransitionBackgroundViewTag];
    }
    [tempViewController beginAppearanceTransition:YES animated:YES];
    
    UIView *sourceView = [transitionContext containerView];
    UIView *popupView = fromViewController.view;
    
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize  = fromViewController.view.bounds.size;
    CGRect popupStartRect = fromViewController.view.frame;
    CGRect popupEndRect;
    
    switch (self.transitionType) {
        case QDCustomTransitionTypeDropDown:
        {
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      -popupSize.height,
                                      popupSize.width,
                                      popupSize.height);
        }
            break;
        case QDCustomTransitionTypePopUp:
        case QDCustomTransitionTypeDefault:
        default:
        {
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      sourceSize.height,
                                      popupSize.width,
                                      popupSize.height);
        }
            break;
    }
    if (self.bounce) {
        popupStartRect.origin.y -= 15.f;
        [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
            [UIView addKeyframeWithRelativeStartTime:0. relativeDuration:0.08 animations:^{
                popupView.frame = popupStartRect;
                backgroundView.alpha = 0.92f;
            }];
            [UIView addKeyframeWithRelativeStartTime:0.08 relativeDuration:0.92 animations:^{
                popupView.frame = popupEndRect;
                backgroundView.alpha = 0.0f;
            }];
        } completion:^(BOOL finished) {
            // 移除遮罩
            [tempViewController endAppearanceTransition];
            [backgroundView removeFromSuperview];
            [fromViewController.view removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    else {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            popupView.frame = popupEndRect;
            backgroundView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            // 移除遮罩
            [tempViewController endAppearanceTransition];
            [backgroundView removeFromSuperview];
            [fromViewController.view removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}

@end

@implementation QDCustomizedPresentedControllerHelper

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    QDCustomizedViewControllerPresentingAnimatedTransitioning *transition = [[QDCustomizedViewControllerPresentingAnimatedTransitioning alloc] init];
    transition.transitionType = self.transitionType;
    transition.transitionDuration = self.transitionDuration;
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    QDCustomizedViewControllerDismissingAnimatedTransitioning *transition = [[QDCustomizedViewControllerDismissingAnimatedTransitioning alloc] init];
    transition.transitionType = self.transitionType;
    transition.transitionDuration = self.transitionDuration;
    transition.bounce = self.bounce;
    return transition;
}

@end