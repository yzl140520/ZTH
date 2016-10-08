//
//  NSString+MD5.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

+ (NSString *)md5HexDigest:(NSString*)input;
+ (NSString *)md5:(NSString *)str;

@end
