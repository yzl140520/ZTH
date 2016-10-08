//
//  ZTHListMenuItemInfo.m
//  ZTH
//
//  Created by yzl on 16/8/15.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHListMenuItemInfo.h"

@implementation ZTHListMenuItemInfo
- (instancetype)init{
    self = [super init];
    if (self) {
        _imageName = nil;
        _title = @"";
        _eventBlock = ^(void){};
    }
    return self;
}
@end
