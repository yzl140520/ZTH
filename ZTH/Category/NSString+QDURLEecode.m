//
//  NSString+QDURLEecode.m
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSString+QDURLEecode.h"

static NSString * const CharactersToBeEscapedInQueryString = @"!*'\"();:@&=+$,/?%#[]% ";

@implementation NSString (QDURLEecode)

- (NSString *)qd_URLEncode {
    return [self URLEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)qd_URLDecode {
    return [self URLDecodeUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - Private

- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)CharactersToBeEscapedInQueryString,
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

@end
