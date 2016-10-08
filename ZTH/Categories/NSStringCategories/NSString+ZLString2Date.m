//
//  NSString+string2Date.m
//  ZTH
//
//  Created by yzl on 16/6/2.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "NSString+ZLString2Date.h"
#import "ZTHDateFormatterFactory.h"
@implementation NSString (ZLString2Date)
- (NSDate*)string2DateWithFormate:(NSString*)formate{
    NSDateFormatter* fmt = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:formate];
    NSDate* date         = [fmt dateFromString:self];
    return date;
}
@end
