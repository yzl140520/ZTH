//
//  NSMutableAttributedString+utils.m
//  ztjyyd
//
//  Created by yzl on 16/6/16.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "NSMutableAttributedString+utils.h"

@implementation NSMutableAttributedString (utils)

- (CGRect)textRectWithSize:(CGSize)size{
    CGRect textRect = [self boundingRectWithSize:size
                                         options:(NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading|
                                                  NSStringDrawingUsesLineFragmentOrigin)
                                         context:NULL];
    return textRect;
}
@end
