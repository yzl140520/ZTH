//
//  NSDate+QDFormatter.m
//  LMQD
//
//  Created by min zhang on 15/10/19.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSDate+QDFormatter.h"
#import "QDCalendarFactory.h"
#import "NSDateFormatter+QDFactory.h"

static NSUInteger Nearly       = 5;
static NSUInteger TenSeconds   = 10;
static NSUInteger fiftySeconds = 50;
static NSUInteger OneMinute    = 60;
static NSUInteger OneHour      = 60 * 60;

@implementation NSDate (QDFormatter)

/**
 *	@brief	通用时间显示规则
 *
 *	@return	获得时间字符串
 */
- (NSString *)stringOfCommonTimeFormat;
{
    NSTimeInterval timeInterval = -[self timeIntervalSinceNow];
    
    if (timeInterval < Nearly) {
        return NSLocalizedString(@"刚刚", nil);
    }
    else if (timeInterval < fiftySeconds) {
        NSUInteger second = timeInterval / TenSeconds + 1;
        second *= 10;
        return [NSString stringWithFormat:@"%2ld%@", (unsigned long)second,
                NSLocalizedString(@"秒前", nil)];
    } else if (timeInterval < OneMinute) {
        return [NSString stringWithFormat:NSLocalizedString(@"1分钟前", nil)];
    } else if (timeInterval < OneHour) {
        NSUInteger minute = timeInterval / OneMinute;
        return [NSString stringWithFormat:NSLocalizedString(@"%2ld分钟前", nil), minute];
    } else {
        // 获取年月日
        NSDate *date = [NSDate date];
        NSCalendar *calendar = [[QDCalendarFactory shared] calendarWithCalendarIdentifier:NSGregorianCalendar];
        calendar.timeZone = [NSTimeZone systemTimeZone];
        NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
        NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
        NSInteger nowYear  = [comps year];
        NSInteger nowMonth = [comps month];
        NSInteger nowDay   = [comps day];
        comps = [calendar components:unitFlags fromDate:self];
        NSInteger year  = [comps year];
        NSInteger month = [comps month];
        NSInteger day   = [comps day];
        
        // 创建时间格式生成实例
        NSDateFormatter *timeFormatter;
        
        if (nowYear == year
            && nowMonth == month
            && nowDay == day) {                                                     // 今天
            timeFormatter = [NSDateFormatter todayHHmmCommonDateFormatter];
        } else if (nowYear == year) {                                               // 今年
            timeFormatter = [NSDateFormatter MMddHHmmCommonDateFormatter];
        } else {                                                                    // 其他
            timeFormatter = [NSDateFormatter yyMMddHHmmCommonDateFormatter];
        }
        NSString *dateString = [timeFormatter stringFromDate:self];
        return dateString;
    }
}

@end
