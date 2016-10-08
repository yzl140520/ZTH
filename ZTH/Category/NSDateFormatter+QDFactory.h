//
//  NSDateFormatter+QDFactory.h
//  LMQD
//
//  Created by min zhang on 15/10/19.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (QDFactory)

/**
 *  返回格式化类型为 "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ" 的 NSDateFormatter 对象
 */
+ (instancetype)dateFormatterForMapping;

/**
 *  返回格式化类型为 "yyyy-MM-dd_HH-mm-ss" 的 NSDateFormatter 对象
 */
+ (instancetype)dateFormatterForLongStyle;

/**
 *  返回格式化类型为 "yyyy-MM-dd" 的 NSDateFormatter 对象
 */
+ (instancetype)dateFormatterForMiddleStyle;

/**
 *  返回格式化类型为 "HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)HHmmCommonDateFormatter;

/**
 *  返回格式化类型为 "'Today' HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)todayHHmmCommonDateFormatter;

/**
 *  返回格式化类型为 "'Yesterday'" 的 NSDateFormatter 对象
 */
+ (instancetype)yesterdayCommonDateFormatter;

/**
 *  返回格式化类型为 "'Yesterday' HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)yesterdayHHmmCommonDateFormatter;

/**
 *  返回格式化类型为 "MM-dd" 的 NSDateFormatter 对象
 */
+ (instancetype)MMddCommonDateFormatter;

/**
 *  返回格式化类型为 "MM-dd HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)MMddHHmmCommonDateFormatter;

/**
 *  返回格式化类型为 "yy-MM-dd" 的 NSDateFormatter 对象
 */
+ (instancetype)yyMMddCommonDateFormatter;

/**
 *  返回格式化类型为 "yy-MM-dd HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)yyMMddHHmmCommonDateFormatter;

/**
 *  返回格式化类型为 "yyyy.M.d HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)yyyyMdHHmmCommonDateFormatter;

@end
