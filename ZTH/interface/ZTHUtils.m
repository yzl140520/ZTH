//
//  ZTHUtils.m
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHUtils.h"
#include <sys/time.h>

@implementation ZTHUtils
+(unsigned int)mGetTickCount{
    struct timeval tv;
    if(gettimeofday(&tv,NULL)!=0)
    {
        return 0;
    }
    return (tv.tv_sec * 1000) + (tv.tv_usec / 1000);
}
+ (NSString*)safeString:(NSString*)string defaultValue:(NSString*)defaultValue{
    return (string?:(defaultValue?:@""));
}
@end
