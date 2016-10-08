//
//  NSString+Category.m
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "NSString+ZTHUtils.h"

@implementation NSString (ZTHUtils)
-(BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}
-(BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val]&&[scan isAtEnd];
}
-(BOOL)isPureChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
-(BOOL)isIncludeChinese{
    for (int i=0; i<self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (0x4e00 < ch  && ch < 0x9fff) {
            return true;
        }
    }
    return false;
}
-(NSString*)convert2PinYin{
    NSString* strIncludeSpace = [self covert2PinYinIncludeSpace];
    //去掉空格
    __block NSString* retStr = @"";
    NSArray* tmpArray = [strIncludeSpace componentsSeparatedByString:@" "];
    [tmpArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* tmpStr = obj;
        if (tmpStr.length>0) {
            retStr = [NSString stringWithFormat:@"%@%@",retStr,tmpStr];
        }
    }];
    return retStr;
}
-(NSString*)covert2PinYinIncludeSpace{
    if (self==nil || self.length <=0) {
        return @"";
    }
    BOOL isIncludeChinese = [self isIncludeChinese];
    if (isIncludeChinese) {
        CFMutableStringRef string = (__bridge_retained CFMutableStringRef)([self mutableCopy]);
        CFStringTransform((CFMutableStringRef)string,NULL, kCFStringTransformMandarinLatin,NO);
        CFStringTransform((CFMutableStringRef)string,NULL, kCFStringTransformStripDiacritics,NO);
        NSString* tmpStr =  (__bridge NSString *)(string);
        CFRelease(string);
        return tmpStr;
    }else{
        return self;
    }
}
-(NSString*)pinYinHead{
    NSString* pinYinStr = [self covert2PinYinIncludeSpace];
    if (pinYinStr.length <=0) {
        return @"";
    }
    NSArray* tmpArray = [pinYinStr componentsSeparatedByString:@" "];
    __block NSString* pinYinHeadStr = @"";
    [tmpArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* str = obj;
        if (str.length>0) {
            unichar ch = [str characterAtIndex:0];
            NSString* ch_Str = [[NSString alloc]initWithCharacters:&ch length:1];
            pinYinHeadStr = [NSString stringWithFormat:@"%@%@",pinYinHeadStr,ch_Str];
        }
    }];
    return pinYinHeadStr;
}
/*!
 *  @author yzl, 16-06-07 18:06:25
 *
 *  @brief 检测字符串是否为nil，如果为nil则返回默认值，默认值 为nil，则返回空串
 *
 *  @param defaultValue 默认值
 *
 *  @return <#return value description#>
 */
//- (NSString *)safeStringWithDefaultValue:(NSString*)defaultValue{
//    return self? :(defaultValue?:@"");
//}
//
//- (BOOL)nilOrEmpty{
//    return (!self || self.length == 0) ? YES : NO;
//}

- (CGRect)textRectWithFont:(UIFont*)font size:(CGSize)size{
    CGRect rect =  [self boundingRectWithSize:size
                                      options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading
                                          | NSStringDrawingUsesLineFragmentOrigin)
                                   attributes:@{NSFontAttributeName:font}
                                      context:NULL];
    return rect;
}

- (CGRect)textRectWithSize:(CGSize)size
                attributes:(NSDictionary<NSString *, id> *)attributes{
    CGRect rect =  [self boundingRectWithSize:size
                                      options:(NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading
                                               | NSStringDrawingUsesLineFragmentOrigin)
                                   attributes:attributes
                                      context:NULL];
    return rect;

}

//返回字符串所占用的尺寸.
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


- (NSMutableAttributedString*)attributeStringWithFont:(UIFont*)font
                                                color:(UIColor*)color
                                                range:(NSRange)range{
    NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc]initWithString:self];
    if (font) {
        [attributeString addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color) {
        [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attributeString;
}

- (NSMutableAttributedString*)attributeStringWithFont:(UIFont*)font
                                                color:(UIColor*)color
                                            subString:(NSString*)subString{
    NSRange range = NSMakeRange(0, 0);
    if (subString) {
        range = [self rangeOfString:subString];
    }
    NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc]initWithString:self];
    if (font) {
        [attributeString addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color) {
        [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attributeString;

}

- (NSMutableAttributedString*)attributeStringWithFont:(UIFont*)font
                                            lineSpace:(CGFloat)lineSpace
                                        textAlignment:(NSTextAlignment)textAlignment{
    NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc]initWithString:self];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:textAlignment];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    
    return attributeString;

}

//从字符串(控制协议返回的)解析出数组 例如: @""
+ (NSMutableArray *)arrayFromStr:(NSString *)str  spaceStr:(NSString *)spaceStr{
    if (!str || !spaceStr) {
        return nil;
    }
    NSArray* array = [str componentsSeparatedByString:spaceStr];
    NSMutableArray* retArray = [[NSMutableArray alloc]initWithArray:array];
    if ([[retArray lastObject]isEqualToString:@""]) {
        [retArray removeLastObject];
    }
    return retArray;
}

@end
