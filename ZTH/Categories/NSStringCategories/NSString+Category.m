//
//  NSString+Category.m
//  ztjy
//
//  Created by apple on 7/1/15.
//  Copyright (c) 2015 jimi. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)
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

@end
