//
//  ZTHPaySheetCell.m
//  ztjyyd
//
//  Created by yzl on 16/7/12.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "ZTHPaySheetCell.h"

@interface ZTHPaySheetCell()
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief 显示“勾”图
 */
@property (strong, nonatomic) UIImageView* hookImageView;
@end

@implementation ZTHPaySheetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.hookImageView.hidden = !selected;
    // Configure the view for the selected state
}


#pragma mark - setter & getter

- (UILabel*)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 15)];
        _contentLabel.font = [UIFont systemFontOfSize:17];
        _contentLabel.textColor = UIColorFromRGBV(0x333333);
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (UIImageView*)hookImageView{
    if (!_hookImageView) {
        _hookImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_tick_15"]];
    }
    return _hookImageView;
}

#pragma mark - method

- (void)initUI{
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.hookImageView];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(self.contentView).offset(0);
    }];
    
    [self.hookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@15);
        make.height.equalTo(@10);
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView).offset(0);
    }];
    
}
@end
