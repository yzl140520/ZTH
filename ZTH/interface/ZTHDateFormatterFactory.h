//
//  ZTHDateFormatterFactory.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTHDateFormatterFactory : NSObject
DEFINE_SINGLETON_FOR_HEADER(ZTHDateFormatterFactory)
- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
                                    timeZone:(NSTimeZone *)timeZone;

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
                                   andLocale:(NSLocale *)locale
                                    timeZone:(NSTimeZone *)timeZone;

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
                                   andLocale:(NSLocale *)locale;

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
                         andLocaleIdentifier:(NSString *)localeIdentifier;

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;

- (NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)dateStyle
                                      timeStyle:(NSDateFormatterStyle)timeStyle
                                      andLocale:(NSLocale *)locale;

- (NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)dateStyle
                                      timeStyle:(NSDateFormatterStyle)timeStyle
                            andLocaleIdentifier:(NSString *)localeIdentifier;

- (NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)dateStyle
                                   andTimeStyle:(NSDateFormatterStyle)timeStyle;

@end
