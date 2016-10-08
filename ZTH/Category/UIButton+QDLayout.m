//
//  UIButton+QDLayout.m
//  LMQD
//
//  Created by min zhang on 15/10/21.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "UIButton+QDLayout.h"

/**
 *  获取将按钮文字水平居中的偏移
 *
 *  @param button           需设置的按钮
 *  @param titleLeftOffset  标题左偏移
 *  @param titleRightOffset 标题右偏移
 */
void getButtonTitleCenteredOffset(UIButton *button, CGFloat *titleLeftOffset, CGFloat *titleRightOffset)
{
    CGSize size       = [button.titleLabel sizeThatFits:button.bounds.size];
    CGFloat offset    = (button.bounds.size.width - size.width) / 2;
    *titleLeftOffset  = offset - button.titleLabel.frame.origin.x;
    *titleRightOffset = CGRectGetMaxX(button.titleLabel.frame) - (button.bounds.size.width - offset);
}

@implementation UIButton (QDLayout)

- (void)qd_setCenterButtonLayout:(CGFloat)space
{
    [self layoutIfNeeded];
    CGFloat leftOffset      = 0.f;
    CGFloat rightOffset     = 0.f;
    getButtonTitleCenteredOffset(self, &leftOffset, &rightOffset);
    CGFloat imageLeftOffset = self.bounds.size.width * .5f - self.imageView.center.x;
    CGFloat imageTopOffset  = 0.f;
    CGFloat titleTopOffset  = CGRectGetMaxY(self.imageView.frame) - CGRectGetMinY(self.titleLabel.frame) + space;
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopOffset, leftOffset, -titleTopOffset, rightOffset)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(imageTopOffset, imageLeftOffset, -imageTopOffset, -imageLeftOffset)];
}

@end
