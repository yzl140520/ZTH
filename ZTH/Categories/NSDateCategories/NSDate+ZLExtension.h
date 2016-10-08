//
//  NSDate+ZLExtension.h
//  ZTH
//
//  Created by yzl on 16/6/2.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSDate (ZLExtension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)zth_isThisYear;
/**
 *  判断某个时间是否为昨天
 */
- (BOOL)zth_isYesterday;
/**
 *  判断某个时间是否为今天
 */
- (BOOL)zth_isToday;
- (NSInteger)zth_year;
- (NSInteger)zth_month;
- (NSInteger)zth_day;
- (NSInteger)zth_hour;
- (NSInteger)zth_minute;
- (NSInteger)zth_second;
/*!
 *  @author yzl, 16-06-02 16:06:34
 *
 *  @brief 格式是：星期一、星期二、...
 *
 *  @return return value description
 */
- (NSString*)zth_week;
/*!
 *  @author yzl, 16-06-02 16:06:54
 *
 *  @brief yyyy-MM-dd HH:MM:SS
 *
 *  @return return value description
 */
- (NSString*)formateAllJoinByLine;
/*!
 *  @author yzl, 16-06-02 16:06:03
 *
 *  @brief yyyy-MM-dd HH:MM
 *
 *  @return return value description
 */
- (NSString*)formateWithoutSecondJoinByLine;
/*!
 *  @author yzl, 16-06-02 16:06:06
 *
 *  @brief yyyy.MM.dd HH:MM
 *
 *  @return return value description
 */
- (NSString*)formateWithoutSecondJoinByDot;
/*!
 *  @author yzl, 16-06-02 17:06:50
 *
 *  @brief yyyy.MM.dd
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthDayJoinByDot;
/*!
 *  @author yzl, 16-06-02 17:06:55
 *
 *  @brief MM-dd
 *
 *  @return return value description
 */
- (NSString*)formateMonthDayJoinByLine;
/*!
 *  @author yzl, 16-06-02 17:06:30
 *
 *  @brief MM.dd
 *
 *  @return return value description
 */
- (NSString*)formateMonthDayJoinByDot;
/*!
 *  @author yzl, 16-06-02 17:06:01
 *
 *  @brief MM月dd日
 *
 *  @return return value description
 */
- (NSString*)formateMonthDayJoinByChinese;
/*!
 *  @author yzl, 16-06-02 17:06:01
 *
 *  @brief YYYY-MM
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthJoinByLine;
/*!
 *  @author yzl, 16-06-02 17:06:01
 *
 *  @brief YYYY年MM月
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthJoinByChinese;
/*!
 *  @author yzl, 16-06-02 17:06:56
 *
 *  @brief yyyy年MM月dd日
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthDayJoinByChinese;
/*!
 *  @author yzl, 16-06-02 17:06:53
 *
 *  @brief yyyy年MM月dd日 HH:MM:SS
 *
 *  @return return value description
 */
- (NSString*)formateAllJoinByChinese;
/*!
 *  @author yzl, 16-06-02 17:06:39
 *
 *  @brief yyyy年MM月dd日 HH:MM
 *
 *  @return return value description
 */
- (NSString*)formateWithoutSecondJoinByChinese;
/*!
 *  @author yzl, 16-06-02 17:06:50
 *
 *  @brief HH:mm
 *
 *  @return return value description
 */
- (NSString*)formateHourMinute;
/*!
 *  @author yzl, 16-06-02 17:06:50
 *
 *  @brief MM-dd HH:mm
 *
 *  @return return value description
 */
- (NSString*)formateWithoutYearSecondJoinByLine;
/*!
 *  @author yzl, 16-06-03 09:06:35
 *
 *  @brief yyyy-MM-dd
 *
 *  @return return value description
 */
- (NSString*)formateYearMonthDayJoinByLine;
/**
 1.今年
 1> 今天
 * HH:MM
 
 2> 非今天
 * MM-dd
 2.非今年
 1> xxxx-xx-xx xx:xx
 */
- (NSString*)formateForSpecialOne;
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
- (NSString*)formateForSpecialTwo;
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
- (NSString*)formateForSpecialThree;
/**
 >今天
 * HH:mm
 >昨天
 * 昨天 HH:mm
 >前天到第前四天（即从前天往后数五天）
 *星期x HH:mm
 >其它
 *yyyy年MM月dd日 HH:mm
 */
- (NSString*)formateForSpecialFour;
@end
