//
//  NSString+QDUtil.m
//  LMQD
//
//  Created by min zhang on 15/10/26.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSString+QDUtil.h"

@implementation NSString (QDUtil)

- (NSInteger)qd_textNumber
{
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSUInteger length = [self lengthOfBytesUsingEncoding:gbkEncoding];
    CGFloat number = length / 2.f;
    
    return ceil(number);
}

- (NSInteger)qd_unicodeTextNumber
{
    NSInteger strlength = 0;
    UInt16 *p = (UInt16 *)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    NSInteger len = [self length];
    for (NSInteger i = 0; i < len; i++) {
        if (*p) {
            if (*p > 127) {
                strlength += 2;
            } else {
                strlength += 1;
            }
        }
        p++;
    }
    return strlength;
}

- (NSArray *)qd_wordsForString
{
    NSMutableArray *words = [[NSMutableArray alloc] init];
    
    const char *str = [self cStringUsingEncoding:NSUTF8StringEncoding];
    
    char *word;
    for (int i = 0; i < strlen(str);) {
        int len = 0;
        if (str[i] >= 0xFFFFFFFC) {
            len = 6;
        } else if (str[i] >= 0xFFFFFFF8) {
            len = 5;
        } else if (str[i] >= 0xFFFFFFF0) {
            len = 4;
        } else if (str[i] >= 0xFFFFFFE0) {
            len = 3;
        } else if (str[i] >= 0xFFFFFFC0) {
            len = 2;
        } else if (str[i] >= 0x00) {
            len = 1;
        }
        
        word = malloc(sizeof(char) * (len + 1));
        for (int j = 0; j < len; j++) {
            word[j] = str[j + i];
        }
        word[len] = '\0';
        i = i + len;
        
        NSString *oneWord = [NSString stringWithCString:word encoding:NSUTF8StringEncoding];
        free(word);
        [words addObject:oneWord];
    }
    
    return words;
}

- (NSString *)qd_subStringToUnicodeIndex:(NSInteger)index
{
    NSArray *words = [self qd_wordsForString];
    NSMutableString *text = [NSMutableString string];
    [words enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *tempString = [NSString stringWithFormat:@"%@%@", text, obj];
        if ([tempString qd_unicodeTextNumber] <= index) { // 是否达到或超过指定字数了
            [text appendString:obj];
        } else {
            *stop = YES;
        }
    }];
    
    return [text copy];
}

- (BOOL)qd_isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (NSString *)qd_stringForSeconds:(CGFloat)seconds
{
    if (seconds > 0) {
        if (seconds < 60.0f) {
            return [NSString stringWithFormat:@"00:%02.f", floor(seconds)];
        } else if (seconds < 3600.0f) {
            return [NSString stringWithFormat:@"%02.f:%02.f", (CGFloat)((NSInteger)seconds / 60), (CGFloat)((NSInteger)seconds % 60)];
        }
        
        return [NSString stringWithFormat:@"%02.f:%2.f:%02.f", (CGFloat)((NSInteger)seconds / 3600), (CGFloat)(((NSInteger)seconds % 3600) / 60), (CGFloat)((NSInteger)seconds % 60)];
    }
    
    return @"00:00";
}

- (NSString *)qd_stringByTrimmingWhitespaceCharacter
{
    NSString *temp = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return temp;
}

- (BOOL)qd_avatarValidate
{
    // 中英文、数字、下划线匹配 不能以下划线和-开头，不能以_结尾
    NSString *stricterFilterString =@"^(?!_)(?!-)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5\\-]+$";
    NSPredicate *mtNickNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [mtNickNameTest evaluateWithObject:self];
}

- (BOOL)qd_chineseWordValidate
{
    NSUInteger len = self.length;
    for(int i = 0; i < len; i++) {
        unichar a = [self characterAtIndex:i];
        if(!((isalpha(a))
             ||(isalnum(a))
             ||((a >= 0x4e00 && a <= 0x9fa6))
             )) {
            return NO;
        }
    }
    return YES;
}

- (NSString *)qd_stringByTrimmingRepeatedNewlines;
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\n+" options:0 error:NULL];
    NSString *newString = [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@"\n"];
    return newString;
}

@end
