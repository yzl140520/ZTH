//
//  UITableView+noDataDefaultView.m
//  ztjyyd
//
//  Created by yzl on 16/6/14.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "UITableView+noDataDefaultView.h"
#import "ZTHNoDataView.h"
#import <objc/runtime.h>

NSString* const kDefaultView = @"kDefaultView";

@implementation UITableView (noDataDefaultView)
- (void)showNoDataDefaultView{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (!noDataView) {
        noDataView = [ZTHNoDataView defaultNoDataViewWithFrame:self.bounds];
        objc_setAssociatedObject(self, (__bridge const void *)(kDefaultView), noDataView, OBJC_ASSOCIATION_RETAIN);
    }
    noDataView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    noDataView.backgroundColor = self.backgroundColor;
    [self addSubview:noDataView];
    [self bringSubviewToFront:noDataView];
}

- (void)showNoDataDefaultViewWithImageName:(NSString*)imageName
                                   message:(NSString*)message{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (!noDataView) {
        noDataView = [ZTHNoDataView noDataViewWithFrame:self.bounds
                                              imageName:imageName
                                                message:message
                                          detailMessage:nil
                                            buttonTitle:nil
                                      buttonActionBlock:nil];
        objc_setAssociatedObject(self, (__bridge const void *)(kDefaultView), noDataView, OBJC_ASSOCIATION_RETAIN);
    }
    noDataView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    noDataView.backgroundColor = self.backgroundColor;
    [self addSubview:noDataView];
    [self bringSubviewToFront:noDataView];
}

- (void)showNoDataDefaultViewWithImage:(UIImage*)image
                               message:(NSString*)message{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (!noDataView) {
        noDataView = [ZTHNoDataView noDataViewWithFrame:self.bounds
                                                  image:image
                                                message:message
                                          detailMessage:nil
                                            buttonTitle:nil
                                      buttonActionBlock:nil];
        objc_setAssociatedObject(self, (__bridge const void *)(kDefaultView), noDataView, OBJC_ASSOCIATION_RETAIN);
    }
    noDataView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    noDataView.backgroundColor = self.backgroundColor;
    [self addSubview:noDataView];
    [self bringSubviewToFront:noDataView];
}

- (void)showNoDataDefaultViewWithImage:(UIImage *)image
                               message:(NSString *)message
                         detailMessage:(NSString*)detailMessage
                           buttonTitle:(NSString*)buttonTitle
                     buttonActionBlock:(void(^)(void))buttonActionBlock{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (!noDataView) {
        noDataView = [ZTHNoDataView noDataViewWithFrame:self.bounds
                                                  image:image
                                                message:message
                                          detailMessage:detailMessage
                                            buttonTitle:buttonTitle
                                      buttonActionBlock:buttonActionBlock];
        objc_setAssociatedObject(self, (__bridge const void *)(kDefaultView), noDataView, OBJC_ASSOCIATION_RETAIN);
    }
    noDataView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    noDataView.backgroundColor = self.backgroundColor;
    [self addSubview:noDataView];
    [self bringSubviewToFront:noDataView];

}
- (void)hideNoDataDefaultView{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (noDataView) {
        [noDataView removeFromSuperview];
    }
}


#pragma mark - publich method

- (void)setMessageColor:(UIColor*)messageColor{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (noDataView) {
        [noDataView setMessageColor:messageColor];
    }
}

- (void)setMessageFont:(UIFont*)messageFont{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (noDataView) {
        [noDataView setMessageFont:messageFont];
    }
}

- (void)setDetailMessageColor:(UIColor*)messageColor{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (noDataView) {
        [noDataView setDetailMessageColor:messageColor];
    }
}

- (void)setDetailMessageFont:(UIFont*)messageFont{
    ZTHNoDataView* noDataView = objc_getAssociatedObject(self, (__bridge const void *)(kDefaultView));
    if (noDataView) {
        [noDataView setDetailMessageFont:messageFont];
    }
}

@end
