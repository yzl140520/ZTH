//
//  QDCustomizedPresentedControllerHelper.h
//  LMQD
//
//  Created by 阮景雄 on 15/9/28.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, QDCustomTransitionType) {
    QDCustomTransitionTypeDefault = 0,         /**< 从下往上弹出或从上往下消失 */
    QDCustomTransitionTypePopUp,               /**< 从下往上弹出或从上往下消失 */
    QDCustomTransitionTypeDropDown,            /**< 从上往下弹出或从下往上消失 */
};

extern const NSInteger QDCustomizedTransitionBackgroundViewTag;
extern const NSTimeInterval QDCustomizedTransitionDefaultDuration;

@interface QDCustomizedPresentedControllerHelper : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) QDCustomTransitionType transitionType;

@property (nonatomic, assign) NSTimeInterval transitionDuration;

@property (nonatomic, assign) BOOL bounce;

@end