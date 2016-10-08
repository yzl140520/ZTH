//
//  ZTHPopMenuView.h
//  ZTH
//
//  Created by yzl on 16/8/31.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTHPopMenuView : UIView

- (instancetype)initWithMenuItems:(NSMutableArray*)items buttonAction:(void(^)(NSInteger buttonIndex))buttonAction;

- (void)show;

- (void)hide;
@end
