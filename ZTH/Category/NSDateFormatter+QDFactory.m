//
//  NSDateFormatter+QDFactory.m
//  LMQD
//
//  Created by min zhang on 15/10/19.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSDateFormatter+QDFactory.h"
#import "DFDateFormatterFactory.h"

@implementation NSDateFormatter (QDFactory)

+ (instancetype)dateFormatterForMapping
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    return dateFormatter;
}

+ (instancetype)dateFormatterForLongStyle
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yyyy-MM-dd_HH-mm-ss"];
    return dateFormatter;
}

+ (instancetype)dateFormatterForMiddleStyle
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yyyy-MM-dd"];
    return dateFormatter;
}

+ (instancetype)HHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"HH:mm" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)todayHHmmCommonDateFormatter
{
    NSString *format = [NSString stringWithFormat:@"'%@' HH:mm", NSLocalizedString(@"今天", nil)];
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:format andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yesterdayCommonDateFormatter
{
    NSString *format = [NSString stringWithFormat:@"'%@'", NSLocalizedString(@"昨天", nil)];
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:format andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yesterdayHHmmCommonDateFormatter
{
    NSString *format = [NSString stringWithFormat:@"'%@' HH:mm", NSLocalizedString(@"昨天", nil)];
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:format andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)MMddCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"MM-dd" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)MMddHHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"MM-dd HH:mm" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyMMddCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yy-MM-dd" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyMMddHHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yy-MM-dd HH:mm" andLocale:[NSLocale systemLocale] timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

+ (instancetype)yyyyMdHHmmCommonDateFormatter
{
    NSDateFormatter *dateFormatter = [[DFDateFormatterFactory sharedFactory] dateFormatterWithFormat:@"yyyy.M.d HH:mm" timeZone:[NSTimeZone systemTimeZone]];
    return dateFormatter;
}

@end
