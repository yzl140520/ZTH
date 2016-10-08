//
//  NSDateFormatter+ZTHFactory.m
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "NSDateFormatter+ZTHFactory.h"
#import "ZTHDateFormatterFactory.h"
@implementation NSDateFormatter (ZTHFactory)
+ (instancetype)dateFormatterForMapping
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    return dateFormatter;
}

+ (instancetype)dateFormatterForLongStyle
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy-MM-dd_HH-mm-ss"];
    return dateFormatter;
}

+ (instancetype)dateFormatterForMiddleStyle
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy-MM-dd"];
    return dateFormatter;
}

+ (instancetype)HHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"HH:mm" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)todayHHmmCommonDateFormatter
{
    NSString *format = [NSString stringWithFormat:@"'%@' HH:mm", NSLocalizedString(@"今天", nil)];
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:format andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yesterdayCommonDateFormatter
{
    NSString *format = [NSString stringWithFormat:@"'%@'", NSLocalizedString(@"昨天", nil)];
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:format andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yesterdayHHmmCommonDateFormatter
{
    NSString *format = [NSString stringWithFormat:@"'%@' HH:mm", NSLocalizedString(@"昨天", nil)];
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:format andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)MMddCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"MM-dd" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)MMddHHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"MM-dd HH:mm" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyyyMMddCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy-MM-dd" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyMMddCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yy-MM-dd" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyyyMMCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy-MM" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyyyMMChineseCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy年MM月" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyMMddHHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyyyMdHHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[ZTHDateFormatterFactory getInstance] dateFormatterWithFormat:@"yyyy.M.d HH:mm" timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

@end
