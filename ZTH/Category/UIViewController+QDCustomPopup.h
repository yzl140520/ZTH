//
//  UIViewController+QDCustomPopup.h
//  LMQD
//
//  Created by 阮景雄 on 15/9/28.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDCustomizedPresentedControllerHelper.h"

typedef void(^QDCustomPopupCompletion)(void);              /**< Present结束block */

extern NSString *const QDPopupViewControllerWillDismissNotification;

@interface UIViewController (QDCustomPopup)

@property (nonatomic, readonly) UIViewController *qd_popupingViewController;       /**< 被弹出的VC，上层*/
@property (nonatomic, readonly) UIViewController *qd_popupedViewController;        /**< 弹出VC的VC，下层*/

/**
 * 自定义Present方法，转场类型为MPICustomTransitionTypeDefault
 */
- (void)qd_presentPopupViewController:(UIViewController *)popupViewController
                              animated:(BOOL)animated
                            completion:(QDCustomPopupCompletion)completion;

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
                            completion:(QDCustomPopupCompletion)completion;

/**
 *  自定义Dismiss方法,转场类型为MPICustomTransitionTypeDefault
 */
- (void)qd_dismissPopupViewControllerAnimated:(BOOL)animated
                                   completion:(QDCustomPopupCompletion)completion;

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
                                   completion:(QDCustomPopupCompletion)completion;

@end
