//
//  UIFont+QDFont.m
//  LMQD
//
//  Created by min zhang on 15/10/9.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "UIFont+QDFont.h"

@implementation UIFont (QDFont)

+ (instancetype)qd_defaultFontWithSize:(CGFloat)size;
{
//    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
    return [UIFont systemFontOfSize:size];
}

+ (instancetype)qd_boldFontWithSize:(CGFloat)size;
{
    return [UIFont boldSystemFontOfSize:size];
}

@end
