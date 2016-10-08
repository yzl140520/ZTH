//
//  NSString+QDURLEecode.h
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QDURLEecode)

/**
 *  对字符串做HTTP编码
 *
 *  @param string 字符串
 *
 *  @return 编码后的HTTP字符串
 */
- (NSString *)qd_URLEncode;

/**
 *  对字符串做HTTP编码
 *
 *  @param string 字符串
 *
 *  @return 编码后的HTTP字符串
 */
- (NSString *)qd_URLDecode;

@end
