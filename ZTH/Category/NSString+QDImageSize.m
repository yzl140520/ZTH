//
//  NSString+QDImageSize.m
//  LMQD
//
//  Created by min zhang on 15/10/12.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSString+QDImageSize.h"

@implementation NSString (QDImageSize)

#pragma mark - 视频封面尺寸
- (NSString *)qd_imageWithWidth:(CGFloat)width;
{
    width = width * [[UIScreen mainScreen] scale];
    NSString *pathComponent = [NSString stringWithFormat:@"?imageView2/2/w/%d", (int)width];
    return [self stringByAppendingString:pathComponent];
}

- (NSString *)qd_imageSize37
{
    int height = 37 * [[UIScreen mainScreen] scale];
    NSString *pathComponent = [NSString stringWithFormat:@"?imageView2/1/h/%d", height];
    return [self stringByAppendingString:pathComponent];
}

#pragma mark - 头像尺寸

- (NSString *)qd_avatarImageSize70
{
    CGSize size;
    size.width = YMAvatarSize70 * [[UIScreen mainScreen] scale];
    size.height = YMAvatarSize70 * [[UIScreen mainScreen] scale];
    return [self stringWithImageSize:size];
}

- (NSString *)qd_avatarImageSize65;
{
    CGSize size;
    size.width = YMAvatarSizeBig * [[UIScreen mainScreen] scale];
    size.height = YMAvatarSizeBig * [[UIScreen mainScreen] scale];
    return [self stringWithImageSize:size];
}

- (NSString *)qd_avatarImageSize45;
{
    CGSize size;
    size.width = YMAvatarSizeMedium * [[UIScreen mainScreen] scale];
    size.height = YMAvatarSizeMedium * [[UIScreen mainScreen] scale];
    return [self stringWithImageSize:size];
}

- (NSString *)qd_avatarImageSize40;
{
    CGSize size;
    size.width = YMAvatarSize40 * [[UIScreen mainScreen] scale];
    size.height = YMAvatarSize40 * [[UIScreen mainScreen] scale];
    return [self stringWithImageSize:size];
}


- (NSString *)qd_avatarImageSize35;
{
    CGSize size;
    size.width = YMAvatarSizeSmall * [[UIScreen mainScreen] scale];
    size.height = YMAvatarSizeSmall * [[UIScreen mainScreen] scale];
    return [self stringWithImageSize:size];
}

- (NSString *)qd_avatarImageSize30
{
    CGSize size;
    size.width = YMAvatarSizeTiny * [[UIScreen mainScreen] scale];
    size.height = YMAvatarSizeTiny * [[UIScreen mainScreen] scale];
    return [self stringWithImageSize:size];
}

#pragma mark - 处理尺寸方法
- (NSString *)stringWithImageSize:(CGSize)size
{
    NSString *pathComponent = [NSString stringWithFormat:@"?imageView2/5/w/%d/h/%d", (int)size.width, (int)size.height];
    return [self stringByAppendingString:pathComponent];
}

#pragma mark - 缩略图
- (NSString *)ym_commentImage
{
    NSString *pathComponent = [NSString stringWithFormat:@"?imageView2/2/w/%d",(int)(YMActivityCommentImageWidth * [[UIScreen mainScreen] scale])];
    return [self stringByAppendingString:pathComponent];
}

@end
