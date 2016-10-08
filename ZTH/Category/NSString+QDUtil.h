//
//  NSString+QDUtil.h
//  LMQD
//
//  Created by min zhang on 15/10/26.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QDUtil)

/**
 *	@brief	分享的文字字数计算
 *
 *	@param 	text 	分享文字
 *
 *	@return	个数
 */
- (NSInteger)qd_textNumber;

/**
 *  计算字符串字符数
 *
 *  @return 个数
 */
- (NSInteger)qd_unicodeTextNumber;


/**
 *  计算字符串中的文字个数，英文、中文、表情文
 *
 *  @param string 进行转换的字符串
 *
 *  @return 全部的文字
 */
- (NSArray *)qd_wordsForString;

/**
 *  截取从 0-n 的 unicode 编码的字符
 *
 *  @return 截取后的字符串
 */
- (NSString *)qd_subStringToUnicodeIndex:(NSInteger)index;

/**
 *	@brief	判断nsstring是否为数字
 *
 *	@param 	string 	string
 *
 *	@return	是非
 */
- (BOOL)qd_isPureInt;

/**
 *  根据秒数返回"xx:xx"或"xx:xx:xx"格式的时间显示
 *
 *  @param seconds 秒数
 *
 *  @return 指定格式的输出字符串
 */
+ (NSString *)qd_stringForSeconds:(CGFloat)seconds;

/**
 *  去除字符串前后空格
 */
- (NSString *)qd_stringByTrimmingWhitespaceCharacter;

/**
 *  判断昵称是否合法
 */
- (BOOL)qd_avatarValidate;

/**
 *  判断字符必须是中英文
 */
- (BOOL)qd_chineseWordValidate;

/**
 *  去除字符串中的连续换行
 */
- (NSString *)qd_stringByTrimmingRepeatedNewlines;

@end
