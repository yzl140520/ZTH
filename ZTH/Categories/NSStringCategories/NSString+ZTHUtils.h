//
//  NSString+Category.h
//  ztjy
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (ZTHUtils)
//检查字符串是否是纯数字
-(BOOL)isPureInt;
/**
 *  @author yzl, 15-07-04 16:07:16
 *
 *  检查字符串是否是浮点型字符串
 *
 *  @return return value description
 */
-(BOOL)isPureFloat;
/**
 *  @author yzl, 15-07-04 16:07:50
 *
 *  检查字符串中是否包含中文
 *
 *  @return return value description
 */
-(BOOL)isPureChinese;
/**
 *  @author yzl, 15-07-04 16:07:50
 *
 *  检查字符串中是否包含中文
 *
 *  @return return value description
 */
-(BOOL)isIncludeChinese;
/**
 *  @author yzl, 15-07-04 16:07:42
 *
 *  字符串转换成拼音
 *
 *  @return <#return value description#>
 */
-(NSString*)convert2PinYin;
/**
 *  @author yzl, 15-07-04 16:07:55
 *
 *  拼音首字母
 *
 *  @return <#return value description#>
 */
-(NSString*)pinYinHead;
/**
 *  @author yzl, 15-07-04 16:07:09
 *
 *  包含空格的拼音转换后的字符，如 che shi bao bao
 *
 *  @return <#return value description#>
 */
-(NSString*)covert2PinYinIncludeSpace;

/*!
 *  @author yzl, 16-06-07 18:06:25
 *
 *  @brief 检测字符串是否为nil，如果为nil则返回默认值，默认值 为nil，则返回空串
 *
 *  @param defaultValue 默认值
 *
 *  @return <#return value description#>
 */
//- (NSString *)safeStringWithDefaultValue:(NSString*)defaultValue;

//- (BOOL)nilOrEmpty;

- (CGRect)textRectWithFont:(UIFont*)font size:(CGSize)size;

- (CGRect)textRectWithSize:(CGSize)size
                attributes:(NSDictionary<NSString *, id> *)attributes;

- (NSMutableAttributedString*)attributeStringWithFont:(UIFont*)font
                                                color:(UIColor*)color
                                                range:(NSRange)range;

- (NSMutableAttributedString*)attributeStringWithFont:(UIFont*)font
                                                color:(UIColor*)color
                                            subString:(NSString*)subString;
- (NSMutableAttributedString*)attributeStringWithFont:(UIFont*)font
                                            lineSpace:(CGFloat)lineSpace
                                        textAlignment:(NSTextAlignment)textAlignment;
+ (NSMutableArray *)arrayFromStr:(NSString *)str spaceStr:(NSString *)spaceStr;


//返回字符串所占用的尺寸.
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
