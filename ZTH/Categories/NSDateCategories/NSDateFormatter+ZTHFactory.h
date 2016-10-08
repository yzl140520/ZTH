//
//  NSDateFormatter+ZTHFactory.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ZTHFactory)
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
 *  返回格式化类型为 "yyyy-MM-dd" 的 NSDateFormatter 对象
 */
+ (instancetype)yyyyMMddCommonDateFormatter;

/**
 *  返回格式化类型为 "yy-MM-dd" 的 NSDateFormatter 对象
 */
+ (instancetype)yyMMddCommonDateFormatter;

/**
 *  返回格式化类型为 "yyyy-MM" 的 NSDateFormatter 对象
 */
+ (instancetype)yyyyMMCommonDateFormatter;

/**
 *  返回格式化类型为 "yyyy年MM月" 的 NSDateFormatter 对象
 */
+ (instancetype)yyyyMMChineseCommonDateFormatter;

/**
 *  返回格式化类型为 "yy-MM-dd HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)yyMMddHHmmCommonDateFormatter;

/**
 *  返回格式化类型为 "yyyy.M.d HH:mm" 的 NSDateFormatter 对象
 */
+ (instancetype)yyyyMdHHmmCommonDateFormatter;
@end
