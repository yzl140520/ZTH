//
//  QDCustomPopupManager.h
//  LMQD
//
//  Created by 阮景雄 on 15/9/29.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QDCustomPopupManager : NSObject

+ (instancetype)sharedManager;

@property (assign, nonatomic) NSUInteger customPopupCount;

@property (copy, nonatomic) void(^completion)();

@end
