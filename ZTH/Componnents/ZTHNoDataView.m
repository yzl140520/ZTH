//
//  ZTHNoDataView.m
//  ztjyyd
//
//  Created by yzl on 16/6/12.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "ZTHNoDataView.h"
#import "NSString+ZTHUtils.h"
#import "UIColor+ZTHImage.h"
#import "NSMutableAttributedString+utils.h"
#import "ZTHUtils.h"
@interface ZTHNoDataView()
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief Description
 */
@property (strong, nonatomic) UIImage* noDataImage;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief Description
 */
@property (strong, nonatomic) NSString* message;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief 详细说明
 */
@property (strong, nonatomic) NSString* detailMessage;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief 按钮名称
 */
@property (strong, nonatomic) NSString* buttonTitle;
/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief Description
 */
@property (copy, nonatomic) void(^buttonActionBlock)(void);
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief Description
 */
@property (strong, nonatomic) UIImageView* imageView;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief Description
 */
@property (strong, nonatomic) UILabel* messageLabel;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief detail
 */
@property (strong, nonatomic) UILabel* detailLabel;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief button
 */
@property (strong, nonatomic) UIButton* button;
@end
@implementation ZTHNoDataView

+ (instancetype)noDataViewWithFrame:(CGRect)frame
                              image:(UIImage*)image
                            message:(NSString*)message
                      detailMessage:(NSString*)detailMessage
                        buttonTitle:(NSString*)buttonTitle
                  buttonActionBlock:(void(^)(void))buttonActionBlock{
    ZTHNoDataView* noDataView = [[ZTHNoDataView alloc]initWithFrame:frame
                                                              image:image
                                                            message:message
                                                      detailMessage:detailMessage
                                                        buttonTitle:buttonTitle
                                                  buttonActionBlock:buttonActionBlock];
    return noDataView;
}

+ (instancetype)noDataViewWithFrame:(CGRect)frame
                          imageName:(NSString*)imageName
                            message:(NSString*)message
                      detailMessage:(NSString*)detailMessage
                        buttonTitle:(NSString*)buttonTitle
                  buttonActionBlock:(void(^)(void))buttonActionBlock{
    UIImage* image = imageName?[UIImage imageNamed:imageName]:nil;
    return [ZTHNoDataView noDataViewWithFrame:frame
                                        image:image
                                      message:message
                                detailMessage:detailMessage
                                  buttonTitle:buttonTitle
                            buttonActionBlock:buttonActionBlock];
}

+ (instancetype)defaultNoDataViewWithFrame:(CGRect)frame{
    return  [ZTHNoDataView noDataViewWithFrame:frame
                                     imageName:@"classAlbum_pic1"
                                       message:@"暂时没有数据"
                                 detailMessage:nil
                                   buttonTitle:nil
                             buttonActionBlock:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
                        image:(UIImage*)image
                      message:(NSString*)message
                detailMessage:(NSString*)detailMessage
                  buttonTitle:(NSString*)buttonTitle
            buttonActionBlock:(void(^)(void))buttonActionBlock{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.973 alpha:1.000];
        self.noDataImage     = image;
        self.message         = message;
        self.detailMessage   = detailMessage;
        self.buttonTitle     = buttonTitle;
        self.buttonActionBlock = buttonActionBlock;
        [self initSubviews];
    }
    return self;

}

- (void)initSubviews{
    if (self.noDataImage) {
        [self addSubview:self.imageView];
        self.imageView.image = self.noDataImage;
        CGFloat width = MIN(self.noDataImage.size.width, UISCREEN_WIDTH);
        CGFloat height = width*self.noDataImage.size.height/self.noDataImage.size.width;
        CGFloat distance = CGRectGetHeight(self.frame)/2.0 - height;
        if ( distance > 30) {
            [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(width));
                make.height.equalTo(@(height));
                make.centerX.equalTo(self.mas_centerX).offset(0);
                make.bottom.equalTo(self.mas_centerY).offset(0);
            }];
        }else{
            CGFloat offset = distance + 30;
            [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(width));
                make.height.equalTo(@(height));
                make.centerX.equalTo(self.mas_centerX).offset(0);
                make.bottom.equalTo(self.mas_centerY).offset(offset);
            }];
            
        }
        
    }
    [self addSubview:self.messageLabel];
    NSString* text = [ZTHUtils safeString:self.message defaultValue:@""];
    NSMutableAttributedString* attributeString = [text attributeStringWithFont:self.messageLabel.font
                                                                     lineSpace:5
                                                                 textAlignment:NSTextAlignmentCenter];
    self.messageLabel.attributedText = attributeString;
    CGRect textRect = [attributeString textRectWithSize:CGSizeMake(300, CGFLOAT_MAX)];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(ceil(CGRectGetHeight(textRect))));
        make.width.equalTo(@300);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        if (self.noDataImage) {
            make.top.equalTo(self.imageView.mas_bottom).offset(15);
        }else{
            make.centerY.equalTo(self.mas_centerY).offset(0);
        }
    }];
    
    [self addSubview:self.detailLabel];
    NSString* detailMessage = [ZTHUtils safeString:self.detailMessage defaultValue:@""];
    CGRect detailRect = [detailMessage textRectWithFont:self.detailLabel.font
                                                   size:CGSizeMake(300, CGFLOAT_MAX)];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(ceil(CGRectGetHeight(detailRect))));
        make.width.equalTo(@300);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.top.equalTo(self.messageLabel.mas_bottom).offset(10);
    }];

    if (self.detailMessage && ![self.detailMessage isEqualToString:@""]) {
        self.detailLabel.hidden = NO;
        self.detailLabel.text = detailMessage;
    }else{
        self.detailLabel.hidden = YES;
    }
    
    if (self.buttonTitle && ![self.buttonTitle isEqualToString:@""]) {
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@35);
            make.width.equalTo(@210);
            make.centerX.equalTo(self.mas_centerX).offset(0);
            if (!self.detailLabel.hidden) {
                make.top.equalTo(self.detailLabel.mas_bottom).offset(10);
            }else{
                make.top.equalTo(self.messageLabel.mas_bottom).offset(10);
            }
        }];
    }
}

#pragma mark - setter & getter

- (UIImageView*)imageView{
    if (!_imageView) {
        _imageView             = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UILabel*)messageLabel{
    if (!_messageLabel) {
        _messageLabel               = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
        _messageLabel.font          = [UIFont systemFontOfSize:16];
        _messageLabel.textColor     = [UIColor colorWithWhite:0.400 alpha:1.000];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _messageLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.000];
    }
    return _messageLabel;
}

- (UILabel*)detailLabel{
    if (!_detailLabel) {
        _detailLabel               = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 15)];
        _detailLabel.font          = [UIFont systemFontOfSize:13];
        _detailLabel.textColor     = [UIColor colorWithWhite:0.400 alpha:1.000];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.numberOfLines = 0;
        _detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _detailLabel.backgroundColor = [UIColor colorWithRed:0.806 green:1.000 blue:0.075 alpha:0.000];
    }
    return _detailLabel;
}

- (UIButton*)button{
    if (!_button) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 210, 35)];
        _button.layer.cornerRadius = CGRectGetHeight(_button.frame)/2.0;
        _button.layer.borderColor = [UIColorFromRGBV(0x00b6f8)CGColor];
        _button.layer.borderWidth = 0.7;
        _button.clipsToBounds = YES;
        _button.titleLabel.font = [UIFont systemFontOfSize:16];
        [_button setBackgroundImage:[[UIColor colorWithWhite:0.500 alpha:0.200] zth_imageWithSize:CGSizeMake(210, 35)] forState:UIControlStateHighlighted];
        if (self.buttonTitle) {
            [_button setTitle:self.buttonTitle forState:UIControlStateNormal];
        }
        [_button addTarget:self action:@selector(buttonAction:)
          forControlEvents:UIControlEventTouchUpInside];
        [_button setTitleColor:UIColorFromRGBV(0x00b6f8)
                      forState:UIControlStateNormal];
    }
    return _button;
}



#pragma mark - response method
- (void)buttonAction:(UIButton*)sender{
    if (self.buttonActionBlock) {
        self.buttonActionBlock();
    }
}
#pragma mark - publich method

- (void)setMessageColor:(UIColor*)messageColor{
    if (!messageColor) {
        return;
    }
    self.messageLabel.textColor = messageColor;
}

- (void)setMessageFont:(UIFont*)messageFont{
    if (!messageFont) {
        return;
    }
    self.messageLabel.font = messageFont;
    NSString* text = [ZTHUtils safeString:self.message defaultValue:@""];
    NSMutableAttributedString* attributeString = [text attributeStringWithFont:self.messageLabel.font
                                                                     lineSpace:5
                                                                 textAlignment:NSTextAlignmentCenter];
    self.messageLabel.attributedText = attributeString;
    CGRect textRect = [attributeString textRectWithSize:CGSizeMake(300, CGFLOAT_MAX)];
    [self.messageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(ceil(CGRectGetHeight(textRect))));
        make.width.equalTo(@300);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        if (self.noDataImage) {
            make.top.equalTo(self.imageView.mas_bottom).offset(15);
            
        }else{
            make.top.equalTo(self.mas_centerY).offset(15);
            
        }
    }];

}

- (void)setDetailMessageColor:(UIColor*)messageColor{
    if (!messageColor) {
        return;
    }
    self.detailLabel.textColor = messageColor;
}

- (void)setDetailMessageFont:(UIFont*)messageFont{
    if (!messageFont) {
        return;
    }
    self.detailLabel.font = messageFont;
    NSString* detailMessage = [ZTHUtils safeString:self.detailMessage defaultValue:@""];
    CGRect detailRect = [detailMessage textRectWithFont:self.detailLabel.font
                                                   size:CGSizeMake(300, CGFLOAT_MAX)];
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(ceil(CGRectGetHeight(detailRect))));
        make.width.equalTo(@300);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.top.equalTo(self.messageLabel.mas_bottom).offset(10);
    }];

}

- (void)setButtonFrame:(CGRect)buttonFrame{
    [self.button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(CGRectGetHeight(buttonFrame)));
        make.width.equalTo(@(CGRectGetWidth(buttonFrame)));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        if (!self.detailLabel.hidden) {
            make.top.equalTo(self.detailLabel.mas_bottom).offset(10);
        }else{
            make.top.equalTo(self.messageLabel.mas_bottom).offset(10);
        }
    }];
}

- (void)setButtonTitleColor:(UIColor*)color forState:(UIControlState)state{
    [self.button setTitleColor:color forState:state];
}

- (void)setButtonBackgroundImage:(UIImage*)image forState:(UIControlState)state{
    [self.button setBackgroundImage:image forState:state];
}

- (void)setButtonLayerCornerRadius:(CGFloat)radius{
    self.button.layer.cornerRadius = radius;
}

- (void)setButtonTitleFont:(UIFont*)font{
    self.button.titleLabel.font = font;
}
@end
