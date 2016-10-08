//
//  ZTHUtils.h
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTHUtils : NSObject
+(unsigned int)mGetTickCount;
+ (NSString*)safeString:(NSString*)string defaultValue:(NSString*)defaultValue;

@end
