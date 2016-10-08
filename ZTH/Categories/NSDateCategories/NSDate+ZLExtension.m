//
//  NSDate+ZLExtension.m
//  ZTH
//
//  Created by yzl on 16/6/2.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "NSDate+ZLExtension.h"
#import "NSString+ZLString2Date.h"
#import "ZTHDateFormatterFactory.h"
#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

@implementation NSDate (ZLExtension)

/**
 *  判断某个时间是否为今年
 */
- (BOOL)zth_isThisYear
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//[NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)zth_isYesterday
{
    NSDate *now            = [NSDate date];

    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt   = [[ZTHDateFormatterFactory getInstance]dateFormatterWithFormat:@"yyyy-MM-dd"];//[[NSDateFormatter alloc] init];
//    fmt.dateFormat         = @"yyyy-MM-dd";

    // 2014-04-30
    NSString *dateStr      = [fmt stringFromDate:self];
    // 2014-10-18
    NSString *nowStr       = [fmt stringFromDate:now];

    // 2014-10-30 00:00:00
    NSDate *date           = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now                    = [fmt dateFromString:nowStr];

    NSCalendar *calendar   = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//[NSCalendar currentCalendar];

    NSCalendarUnit unit    = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

/**
 *  判断某个时间是否为今天
 */
- (BOOL)zth_isToday
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[ZTHDateFormatterFactory getInstance]dateFormatterWithFormat:@"yyyy-MM-dd"];//[[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}
- (NSInteger)zth_year{
    NSDateComponents* cmp = [self componentsWithDate:self];
    return cmp.year;
}
- (NSInteger)zth_month{
    NSDateComponents* cmp = [self componentsWithDate:self];
    return cmp.month;
}
- (NSInteger)zth_day{
    NSDateComponents* cmp = [self componentsWithDate:self];
    return cmp.day;
}
- (NSInteger)zth_hour{
    NSDateComponents* cmp = [self componentsWithDate:self];
    return cmp.hour;
}
- (NSInteger)zth_minute{
    NSDateComponents* cmp = [self componentsWithDate:self];
    return cmp.minute;
}
- (NSInteger)zth_second{
    NSDateComponents* cmp = [self componentsWithDate:self];
    return cmp.second;
}
/*!
 *  @author yzl, 16-06-02 16:06:34
 *
 *  @brief 格式是：星期一、星期二、...
 *
 *  @return return value description
 */
- (NSString*)zth_week{
    NSDateComponents* cmp = [self componentsWithDate:self];
    NSString* weekString = [self weekStringWithWeekInt:cmp.weekday];
    return weekString;
}
/*!
 *  @author yzl, 16-06-02 16:06:54
 *
 *  @brief YYYY-MM-DD HH:MM:SS
 *
 *  @return return value description
 */
- (NSString*)formateAllJoinByLine{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSInteger hour   = [self zth_hour];
    NSInteger minute = [self zth_minute];
    NSInteger second = [self zth_second];
    NSString* fmtString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld %.2ld:%.2ld:%.2ld",year,month,day,hour,minute,second];
    return fmtString;
}
/*!
 *  @author yzl, 16-06-02 16:06:03
 *
 *  @brief YYYY-MM-DD HH:MM
 *
 *  @return return value description
 */
- (NSString*)formateWithoutSecondJoinByLine{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSInteger hour   = [self zth_hour];
    NSInteger minute = [self zth_minute];
    NSString* fmtString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld %.2ld:%.2ld",year,month,day,hour,minute];
    return fmtString;
}
/*!
 *  @author yzl, 16-06-02 16:06:06
 *
 *  @brief YYYY.MM.DD HH:MM
 *
 *  @return return value description
 */
- (NSString*)formateWithoutSecondJoinByDot{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSInteger hour   = [self zth_hour];
    NSInteger minute = [self zth_minute];
    NSString* fmtString = [NSString stringWithFormat:@"%ld.%.2ld.%.2ld %.2ld:%.2ld",year,month,day,hour,minute];
    return fmtString;
}
/*!
 *  @author yzl, 16-06-02 17:06:50
 *
 *  @brief YYYY.MM.dd
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthDayJoinByDot{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSString* fmtString = [NSString stringWithFormat:@"%ld.%.2ld.%.2ld",year,month,day];
    return fmtString;
}
/*!
 *  @author yzl, 16-06-02 17:06:55
 *
 *  @brief MM-dd
 *
 *  @return return value description
 */
- (NSString*)formateMonthDayJoinByLine{
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSString* fmtString = [NSString stringWithFormat:@"%.2ld-%.2ld",month,day];
    return fmtString;
}
/*!
 *  @author yzl, 16-06-02 17:06:30
 *
 *  @brief MM.dd
 *
 *  @return return value description
 */
- (NSString*)formateMonthDayJoinByDot{
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSString* fmtString = [NSString stringWithFormat:@"%.2ld.%.2ld",month,day];
    return fmtString;

}
/*!
 *  @author yzl, 16-06-02 17:06:01
 *
 *  @brief MM月dd日
 *
 *  @return return value description
 */
- (NSString*)formateMonthDayJoinByChinese{
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSString* fmtString = [NSString stringWithFormat:@"%.2ld月%.2ld日",month,day];
    return fmtString;

}
/*!
 *  @author yzl, 16-06-02 17:06:01
 *
 *  @brief YYYY-MM
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthJoinByLine{
    NSInteger year  = [self zth_year];
    NSInteger month    = [self zth_month];
    NSString* fmtString = [NSString stringWithFormat:@"%.4ld-%.2ld",year,month];
    return fmtString;    
}
/*!
 *  @author yzl, 16-06-02 17:06:01
 *
 *  @brief YYYY年MM月
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthJoinByChinese{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSString* fmtString = [NSString stringWithFormat:@"%.4ld年%.2ld月",year,month];
    return fmtString;
    
}
/*!
 *  @author yzl, 16-06-02 17:06:56
 *
 *  @brief YYYY年MM月dd日
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthDayJoinByChinese{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSString* fmtString = [NSString stringWithFormat:@"%ld年%.2ld月%.2ld日",year,month,day];
    return fmtString;

}
/*!
 *  @author yzl, 16-06-02 17:06:53
 *
 *  @brief YYYY年MM月dd日 HH:MM:SS
 *
 *  @return return value description
 */
- (NSString*)formateAllJoinByChinese{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSInteger hour   = [self zth_hour];
    NSInteger minute = [self zth_minute];
    NSInteger second = [self zth_second];
    NSString* fmtString = [NSString stringWithFormat:@"%ld年%.2ld月%.2ld日 %.2ld:%.2ld:%.2ld",year,month,day,hour,minute,second];
    return fmtString;

}
/*!
 *  @author yzl, 16-06-02 17:06:39
 *
 *  @brief YYYY年MM月dd日 HH:MM
 *
 *  @return return value description
 */
- (NSString*)formateWithoutSecondJoinByChinese{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSInteger hour   = [self zth_hour];
    NSInteger minute = [self zth_minute];
    NSString* fmtString = [NSString stringWithFormat:@"%ld年%.2ld月%.2ld日 %.2ld:%.2ld",year,month,day,hour,minute];
    return fmtString;
}
/*!
 *  @author yzl, 16-06-02 17:06:50
 *
 *  @brief HH:mm
 *
 *  @return return value description
 */
- (NSString*)formateHourMinute{
    NSInteger hour   = [self zth_hour];
    NSInteger minute = [self zth_minute];
    NSString* fmtString = [NSString stringWithFormat:@"%.2ld:%.2ld",hour,minute];
    return fmtString;
}
/*!
 *  @author yzl, 16-06-02 17:06:50
 *
 *  @brief MM-dd HH:mm
 *
 *  @return return value description
 */
- (NSString*)formateWithoutYearSecondJoinByLine{
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSInteger hour   = [self zth_hour];
    NSInteger minute = [self zth_minute];
    NSString* fmtString = [NSString stringWithFormat:@"%.2ld-%.2ld %.2ld:%.2ld",month,day,hour,minute];
    return fmtString;
}
/*  @author yzl, 16-06-03 09:06:35
*
*  @brief YYYY-MM-DD
*
*  @return return value description
*/
- (NSString*)formateYearMonthDayJoinByLine{
    NSInteger year   = [self zth_year];
    NSInteger month  = [self zth_month];
    NSInteger day    = [self zth_day];
    NSString* fmtString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld",year,month,day];
    return fmtString;

}
/**
 1.今年
 1> 今天
 * HH:MM
 
 2> 非今天
 * MM-dd
 2.非今年
 1> xxxx-xx-xx xx:xx
 */
- (NSString*)formateForSpecialOne{
    if ([self zth_isThisYear]) { // 今年
        if ([self zth_isToday]) { // 今天
            NSString* fmtString = [NSString stringWithFormat:@"今天%@",[self formateHourMinute]];
            return fmtString;
        } else { // 今年的其他日子
            return [self formateMonthDayJoinByLine];
        }
    } else { // 非今年
        return [self formateWithoutSecondJoinByLine];
    }
}
/**
 1.今年
 1> 今天
 * 今天 HH:mm
 
 2> 昨天
 * 昨天 xx:xx
 
 3> 其他
 * xx-xx xx:xx
 
 2.非今年
 1> xxxx-xx-xx xx:xx
 */
- (NSString*)formateForSpecialTwo{
    if ([self zth_isThisYear]) { // 今年
        if ([self zth_isToday]) { // 今天
            NSString* fmtString = [NSString stringWithFormat:@"%@",[self formateHourMinute]];
            return fmtString;
        } else if([self zth_isYesterday]) {
            NSString* fmtString = [NSString stringWithFormat:@"昨天 %@",[self formateHourMinute]];
            return fmtString;
        } else { // 今年的其他日子
            return [self formateWithoutYearSecondJoinByLine];
        }
    } else { // 非今年
        return [self formateWithoutSecondJoinByLine];
    }

}
/**
 1.今年
 1> 今天
 * 1分内： 刚刚
 * 1分~59分内：xx分钟前
 * 大于60分钟：xx小时前
 
 2> 昨天
 * 昨天 xx:xx
 
 3> 其他
 * xx-xx xx:xx
 
 2.非今年
 1> xxxx-xx-xx xx:xx
 */
- (NSString*)formateForSpecialThree{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //获取星期
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDate* dateNow = [NSDate date];
    NSDateComponents* cmps = [gregorian components:unitFlags fromDate:self toDate:dateNow options:0];

    if ([self zth_isThisYear]) { // 今年
        if ([self zth_isToday]) { // 今天
            if (cmps.hour >= 1 && cmps.hour < 24) {
                return [NSString stringWithFormat:@"%ld小时前", (long)cmps.hour];
            } else if (cmps.hour >= 24) {
                 NSString* fmtString = [NSString stringWithFormat:@"昨天 %@",[self formateHourMinute]];
                return fmtString;
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前", (long)cmps.minute];
            } else {
                return @"刚刚";
            }
        } else if([self zth_isYesterday]) {
            NSString* fmtString = [NSString stringWithFormat:@"昨天 %@",[self formateHourMinute]];
            return fmtString;
        } else { // 今年的其他日子
            return [self formateWithoutYearSecondJoinByLine];
        }
    } else { // 非今年
        return [self formateWithoutSecondJoinByLine];
    }

}
/**
 >今天
 * HH:mm
 >昨天
 * 昨天 HH:mm
 >前天到第前四天（即从前天往后数五天）
 *星期x HH:mm
 >其它
 *YYYY年MM月dd日 HH:mm
 */
- (NSString*)formateForSpecialFour{
    NSDate* dateNowYearMonthDay = [[[NSDate date] formateYearMonthDayJoinByLine] string2DateWithFormate:@"yyyy-MM-dd"];
    NSDate* selfYearMonthDay    = [[self formateYearMonthDayJoinByLine]string2DateWithFormate:@"yyyy-MM-dd"];
    NSInteger hour = [selfYearMonthDay hoursAfterDate:dateNowYearMonthDay];;
    if ([self zth_isThisYear]) { // 今年
        if ([self zth_isToday]) { // 今天
            NSString* fmtString = [self formateHourMinute];
            return fmtString;
        } else if([self zth_isYesterday]) {
            NSString* fmtString = [NSString stringWithFormat:@"昨天 %@",[self formateHourMinute]];
            return fmtString;
        } else if(hour >= -144 && hour < -24) { // 今年的其他日子
            NSString* weekString = [self zth_week];
            NSString* time = [self formateHourMinute];
            NSString* fmtString = [NSString stringWithFormat:@"%@ %@",weekString,time];
            return fmtString;
        }else{
            return [self formateWithoutSecondJoinByChinese];
        }
    } else { // 非今年
        return [self formateWithoutSecondJoinByChinese];
    }

}
#pragma mark - pravite
- (NSDateComponents*)componentsWithDate:(NSDate*)date{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //获取星期
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *cmp = [gregorian components:unitFlags fromDate:date];
    return cmp;
}
- (NSString*)weekStringWithWeekInt:(NSInteger)weekInt{
    NSString* weekStr = @"";
    switch (weekInt) {
        case 1:
            weekStr = @"星期日";
            break;
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        case 7:
            weekStr = @"星期六";
            break;
        default:
            break;
    }
    return weekStr;
}
- (NSInteger) hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_HOUR);
}
@end
