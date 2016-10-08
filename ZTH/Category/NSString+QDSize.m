//
//  NSString+QDSize.m
//  LMQD
//
//  Created by 阮景雄 on 15/9/13.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import "NSString+QDSize.h"

@implementation NSString (QDSize)

- (CGSize)qd_sizeWithFont:(UIFont *)font
           constranedSize:(CGSize)constranedSize
{
    NSDictionary *attributes = @{NSFontAttributeName: font};
    return [self qd_sizeWithAttributes:attributes constranedSize:constranedSize];
}

- (CGSize)qd_sizeWithAttributes:(NSDictionary *)attributes
                 constranedSize:(CGSize)constranedSize
{
    // !!!: 需要传入context，防止文本中有/n的时候constanedSize限制高度无限。
    // 例如：文本换行了10行，但是我们只想显示6行，不设置context，计算的文本高度会比constranedSize的高度高。他会给出显示所有行需要的高度
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize size = [self boundingRectWithSize:constranedSize
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attributes context:context].size;
    
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    
    return size;
}
@end
