//
//  QDCustomPopupManager.m
//  LMQD
//
//  Created by 阮景雄 on 15/9/29.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import "QDCustomPopupManager.h"

@implementation QDCustomPopupManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken = 0;
    static QDCustomPopupManager *_sharedManager = nil;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

- (instancetype)init
{
    if ((self = [super init])) {
        _customPopupCount = 0;
    }
    
    return self;
}

- (void)setCustomPopupCount:(NSUInteger)customPopupCount
{
    if (customPopupCount == 0 && self.completion) {
        self.completion();
        self.completion = nil;
    }
    _customPopupCount = customPopupCount;
}

@end
