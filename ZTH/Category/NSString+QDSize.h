//
//  NSString+QDSize.h
//  LMQD
//
//  Created by 阮景雄 on 15/9/13.
//  Copyright (c) 2015年 Yimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QDSize)

- (CGSize)qd_sizeWithFont:(UIFont *)font
           constranedSize:(CGSize)constranedSize;

- (CGSize)qd_sizeWithAttributes:(NSDictionary *)attributes
                 constranedSize:(CGSize)constranedSize;

@end
