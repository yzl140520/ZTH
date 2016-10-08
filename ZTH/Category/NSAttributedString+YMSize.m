//
//  NSAttributedString+YMSize.m
//  Beauty
//
//  Created by min zhang on 16/3/17.
//  Copyright © 2016年 Yimeng. All rights reserved.
//

#import "NSAttributedString+YMSize.h"

@implementation NSAttributedString (YMSize)

- (CGSize)qd_sizeWithConstranedSize:(CGSize)constranedSize
{
    // !!!: 需要传入context，防止文本中有/n的时候constanedSize限制高度无限。
    // 例如：文本换行了10行，但是我们只想显示6行，不设置context，计算的文本高度会比constranedSize的高度高。他会给出显示所有行需要的高度
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize size = [self boundingRectWithSize:constranedSize
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     context:context].size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    
    return size;
}

@end
