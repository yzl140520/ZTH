//
//  ZTHPaySheetTitleView.m
//  ztjyyd
//
//  Created by yzl on 16/7/12.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "ZTHPaySheetTitleView.h"

@implementation ZTHPaySheetTitleView{
    ZTHPaySheetTitleViewStyle _titleViewStyle;
}
- (instancetype)initWithFrame:(CGRect)frame titleViewStyle:(ZTHPaySheetTitleViewStyle)titleViewStyle{
    self = [super initWithFrame:frame];
    if (self) {
        _titleViewStyle = titleViewStyle;
        [self initUI];
    }
    return self;
}


#pragma mark - setter & getter

- (UILabel*)mainTitleLabel{
    if (!_mainTitleLabel) {
        _mainTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 15)];
        _mainTitleLabel.textColor = UIColorFromRGBV(0x666666);
        _mainTitleLabel.font = [UIFont systemFontOfSize:16];
        _mainTitleLabel.textAlignment = NSTextAlignmentCenter;

    }
    return _mainTitleLabel;

}

- (UILabel*)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 15)];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textColor = UIColorFromRGBV(0x999999);
        _detailLabel.textAlignment = NSTextAlignmentCenter;

    }
    return _detailLabel;
}

#pragma mark - method

- (void)initUI{
    [self addSubview:self.mainTitleLabel];
    [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.and.right.equalTo(self).offset(0);
        make.height.equalTo(@15);
    }];
    if (_titleViewStyle == ZTHPaySheetTitleViewDetailStyle) {
        [self addSubview:self.detailLabel];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mainTitleLabel.mas_bottom).offset(7);
            make.left.and.right.equalTo(self).offset(0);
            make.height.equalTo(@15);
        }];
    }
}
@end
