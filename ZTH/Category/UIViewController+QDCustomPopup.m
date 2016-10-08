//
//  UIViewController+QDCustomPopup.m
//  LMQD
//
//  Created by 阮景雄 on 15/9/28.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import "UIViewController+QDCustomPopup.h"
#import <objc/runtime.h>

#import "QDCustomPopupManager.h"

NSString *const QDPopupViewControllerWillDismissNotification = @"QDPopupViewControllerWillDismissNotification";

static const char *kPopupingControllerAssociatedKey    = "kPopupingControllerControllerAssociatedKey";
static const char *kPopupedControllerAssociatedKey     = "kPopupedControllerControllerAssociatedKey";
static const char *kTransitioningDelegateAssociatedKey = "kPopupedTransitioningAssociatedKey";

@interface UIViewController ()

@property (nonatomic, readwrite) UIViewController *qd_popupingViewController;       /**< 被弹出的VC，上层*/
@property (nonatomic, readwrite) id <UIViewControllerTransitioningDelegate> qd_transitioningDelegateInstance;

@end

@implementation UIViewController (QDCustomPopup)

#pragma mark - UIViewController (OBJC_ASSOCIATION)

- (UIViewController *)qd_popupingViewController
{
    return objc_getAssociatedObject(self, kPopupingControllerAssociatedKey);
}

- (void)setQd_popupingViewController:(UIViewController *)qd_popupingViewController
{
    objc_setAssociatedObject(self, kPopupingControllerAssociatedKey, qd_popupingViewController, OBJC_ASSOCIATION_ASSIGN);
}

- (UIViewController *)qd_popupedViewController
{
    return objc_getAssociatedObject(self, kPopupedControllerAssociatedKey);
}

- (void)setQd_popupedViewController:(UIViewController *)qd_popupedViewController
{
    objc_setAssociatedObject(self, kPopupedControllerAssociatedKey, qd_popupedViewController, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setQd_transitioningDelegateInstance:(id<UIViewControllerTransitioningDelegate>)qd_transitioningDelegateInstance
{
    objc_setAssociatedObject(self, kTransitioningDelegateAssociatedKey, qd_transitioningDelegateInstance, OBJC_ASSOCIATION_RETAIN);
}

- (id<UIViewControllerTransitioningDelegate>)qd_transitioningDelegateInstance
{
    return objc_getAssociatedObject(self, kTransitioningDelegateAssociatedKey);
}


/**
 * 自定义Present方法，转场类型为MPICustomTransitionTypeDefault
 */
- (void)qd_presentPopupViewController:(UIViewController *)popupViewController
                              animated:(BOOL)animated
                            completion:(QDCustomPopupCompletion)completion
{
    [self qd_presentPopupViewController:popupViewController
                          transitionType:QDCustomTransitionTypeDefault
                                animated:animated
                              completion:completion];
}

/**
 *  自定义Present方法
 *
 *  @param popupViewController present的ViewController
 *  @param type                转场类型
 *  @param animated            是否需要动画
 *  @param block               完成block
 */
- (void)qd_presentPopupViewController:(UIViewController *)popupViewController
                        transitionType:(QDCustomTransitionType)type
                              animated:(BOOL)animated
                            completion:(QDCustomPopupCompletion)completion
{
    UIViewController *rootViewController = nil;
    if (self.tabBarController) {
        rootViewController = self.tabBarController;
    }
    else if (self.navigationController) {
        rootViewController = self.navigationController;
    }
    else {
        rootViewController = self;
    }
    
    UIViewController *presentedViewController = rootViewController.presentedViewController;
    if (presentedViewController && presentedViewController.isBeingDismissed) {
        QDLogError(@"呦呦呦 Bitch");
        return;
    }
    
    if (rootViewController.isBeingPresented) {
        QDLogError(@"呦呦呦 Bitch");
        return;
    }
    
    rootViewController.qd_popupingViewController = popupViewController;
    popupViewController.qd_popupedViewController = rootViewController;
    
    // 让PresentModalViewController透明
    UIModalPresentationStyle presentingStyle = rootViewController.modalPresentationStyle;
    // 兼容iOS8
    popupViewController.modalPresentationStyle = (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)? UIModalPresentationCustom : UIModalPresentationOverCurrentContext;
    rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    QDCustomizedPresentedControllerHelper *presentedControllerHelper = [[QDCustomizedPresentedControllerHelper alloc] init];
    presentedControllerHelper.transitionType = type;
    presentedControllerHelper.transitionDuration = animated ? QDCustomizedTransitionDefaultDuration : 0.f;
    popupViewController.qd_transitioningDelegateInstance = presentedControllerHelper;
    popupViewController.transitioningDelegate = presentedControllerHelper;
    
    [rootViewController presentViewController:popupViewController animated:YES completion:^{
        if (completion) {
            completion();
        }
        [QDCustomPopupManager sharedManager].customPopupCount++;
        popupViewController.transitioningDelegate = nil;
    }];
    // 还原UIModalPresentationStyle，避免其他地方presentViewController时动画丢失问题；
    rootViewController.modalPresentationStyle = presentingStyle;
    
    [[NSNotificationCenter defaultCenter] addObserver:popupViewController
                                             selector:@selector(popupViewControllerWillDismissNotification:)
                                                 name:QDPopupViewControllerWillDismissNotification object:nil];
}

/**
 *  自定义Dismiss方法,转场类型为MPICustomTransitionTypeDefault
 */
- (void)qd_dismissPopupViewControllerAnimated:(BOOL)animated
                                    completion:(QDCustomPopupCompletion)completion
{
    [self qd_dismissPopupViewControllerAnimated:animated
                                 transitionType:QDCustomTransitionTypeDefault
                                         bounce:YES
                                     completion:completion];
}

/**
 *  自定义Dismiss方法
 *
 *  @param animated 是否需要动画
 *  @param type     转场类型
 *  @param block    完成block
 */
- (void)qd_dismissPopupViewControllerAnimated:(BOOL)animated
                               transitionType:(QDCustomTransitionType)type
                                       bounce:(BOOL)bounce
                                   completion:(QDCustomPopupCompletion)completion
{
    UIViewController *rootViewController = self.qd_popupedViewController;
    
    QDCustomizedPresentedControllerHelper *presentedControllerHelper = [[QDCustomizedPresentedControllerHelper alloc] init];
    self.qd_transitioningDelegateInstance = presentedControllerHelper;
    presentedControllerHelper.transitionType = type;
    presentedControllerHelper.transitionDuration = animated ? QDCustomizedTransitionDefaultDuration : 0.f;
    presentedControllerHelper.bounce = bounce;
    self.transitioningDelegate = presentedControllerHelper;
    
    [self dismissViewControllerAnimated:YES completion:^{
        rootViewController.qd_popupingViewController = nil;
        
        if (completion) {
            completion();
        }
        self.transitioningDelegate = nil;
        if (rootViewController) {
            [QDCustomPopupManager sharedManager].customPopupCount--;
        }
    }];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:QDPopupViewControllerWillDismissNotification object:nil];
}

#pragma mark - NSNotification

- (void)popupViewControllerWillDismissNotification:(NSNotification *)notification
{
    [self qd_dismissPopupViewControllerAnimated:NO completion:nil];
}

@end
