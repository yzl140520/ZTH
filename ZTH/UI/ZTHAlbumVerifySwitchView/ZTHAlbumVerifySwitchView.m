//
//  ZTHAlbumVerifySwitchView.m
//  ztjyyd
//
//  Created by yzl on 16/6/15.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "ZTHAlbumVerifySwitchView.h"
@interface ZTHAlbumVerifySwitchView()
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief left button
 */
@property (strong, nonatomic) UIButton* leftButton;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief right button
 */
@property (strong, nonatomic) UIButton* rightButton;
/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief buttonBlock
 */
@property (copy, nonatomic) void(^buttonBlock)(NSInteger buttonIndex);
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief titles
 */
@property (copy, nonatomic) NSArray* titles;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief imageNames
 */
@property (copy, nonatomic) NSArray* imageNames;
/*!
 *  @author yzl, 16-03-03 09:03:14
 *
 *  @brief 选中时的下划线
 */
@property (strong, nonatomic) UILabel* underLine;
@end
@implementation ZTHAlbumVerifySwitchView
- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray*)titles
                   imageNames:(NSArray*)imageNames
                  buttonBlock:(void(^)(NSInteger buttonIndex))buttonBlock{
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        self.imageNames = imageNames;
        self.buttonBlock = buttonBlock;
        _selectedIndex = 0;
        [self initUI];
        
    }
    return self;
    
}

- (void)initUI{
    self.backgroundColor = [UIColor whiteColor];
    UISwipeGestureRecognizer* panGst = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiftGstAction:)];
    [self addGestureRecognizer:panGst];
    self.userInteractionEnabled = YES;
    [self addSubview:self.leftButton];
    self.leftButton.selected = YES;
    CGFloat width = CGRectGetWidth(self.frame)/2.0;
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.bottom.equalTo(self).offset(0);
        make.width.equalTo(@(width));
    }];
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.and.bottom.equalTo(self).offset(0);
        make.width.equalTo(@(width));
    }];
    
    _line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 0.6)];
    _line.backgroundColor = kLineViewColor;
    [self addSubview:_line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(0);
        make.height.equalTo(@0.6);
        make.left.and.right.equalTo(self).offset(0);
    }];
    
    if (self.titles) {
        [self.leftButton setTitle:self.titles[0] forState:UIControlStateNormal];
        [self.rightButton setTitle:self.titles[1] forState:UIControlStateNormal];
    }
    
    if (self.imageNames) {
        [self.leftButton setImage:[UIImage imageNamed:self.imageNames[0]] forState:UIControlStateNormal];
        [self.rightButton setImage:[UIImage imageNamed:self.imageNames[1]] forState:UIControlStateNormal];
    }
    
    [self addSubview:self.underLine];
    CGRect underLineFrame   = self.underLine.frame;
    underLineFrame.origin.y = CGRectGetHeight(self.frame) - 1.5;
    self.underLine.frame    = underLineFrame;
    CGPoint center          = self.underLine.center;
    center.x                = UISCREEN_WIDTH/4;
    self.underLine.center   = center;
}
#pragma mark - setter & getter
- (void)setSelectColor:(UIColor *)color{
    _selectColor = color;
    _underLine.backgroundColor = _selectColor;
    [_leftButton setTitleColor:_selectColor forState:UIControlStateSelected];
    [_rightButton setTitleColor:_selectColor forState:UIControlStateSelected];
}
- (void)setUnselectColor:(UIColor *)color {
    _unselectColor = color;
    [_leftButton setTitleColor:_unselectColor forState:UIControlStateNormal];
    [_rightButton setTitleColor:_unselectColor forState:UIControlStateNormal];
}

- (UIButton*)leftButton{
    if (!_leftButton) {
        _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [_leftButton addTarget:self
                        action:@selector(buttonAction:)
              forControlEvents:UIControlEventTouchUpInside];
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_leftButton setTitleColor:[UIColor colorWithWhite:0.600 alpha:1.000]
                          forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor colorWithRed:0.000 green:0.714 blue:0.973 alpha:1.000]
                          forState:UIControlStateSelected];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _leftButton;
}

- (UIButton*)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [_rightButton addTarget:self
                         action:@selector(buttonAction:)
               forControlEvents:UIControlEventTouchUpInside];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_rightButton setTitleColor:[UIColor colorWithWhite:0.600 alpha:1.000]
                           forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor colorWithRed:0.000 green:0.714 blue:0.973 alpha:1.000]
                           forState:UIControlStateSelected];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];

    }
    return _rightButton;
}

- (UILabel*)underLine{
    if (!_underLine) {
        _underLine = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 2)];
        _underLine.backgroundColor = [UIColor colorWithRed:0.000 green:0.714 blue:0.973 alpha:1.000];
    }
    return _underLine;
}
#pragma mark - response method

- (void)buttonAction:(UIButton*)sender{
    sender.selected = !sender.selected;
    CGPoint center = self.underLine.center;
    NSInteger index = 0;
    if (sender == self.leftButton) {
        self.rightButton.selected = NO;
        self.leftButton.selected = YES;
        center.x = self.leftButton.center.x;
        index = 0 ;

    }else{
        self.leftButton.selected = NO;
        self.rightButton.selected = YES;
        center.x = self.rightButton.center.x;
        index = 1;
    }
    _selectedIndex = index;
    if (self.buttonBlock) {
        self.buttonBlock(index);
    }
    [UIView animateWithDuration:0.4 animations:^{
        self.underLine.center = center;
    }];
    
}

- (void)swiftGstAction:(UISwipeGestureRecognizer*)gst{
    if (gst.direction == UISwipeGestureRecognizerDirectionLeft && self.selectedIndex != 1) {
        [self selectSwitchViewAtIndex:1];
        
    }else if (gst.direction == UISwipeGestureRecognizerDirectionRight && self.selectedIndex != 0){
        [self selectSwitchViewAtIndex:0];
    }

}
#pragma mark - method
- (void)selectSwitchViewAtIndex:(NSInteger)index{
    _selectedIndex = index;
    UIButton* button = nil;
    if (index == 0) {
        button = self.leftButton;
    }else{
        button = self.rightButton;
    }
    [self buttonAction:button];
}

/*!
 *  @author yzl
 *
 *  @brief 只对切换界面进行选种，不执行block操作
 *
 *  @param index index description
 */
- (void)onlySelectSwitchViewAtIndex:(NSInteger)index{
    CGPoint center = self.underLine.center;
    if (0 == index) {
        self.rightButton.selected = NO;
        self.leftButton.selected = YES;
        center.x = self.leftButton.center.x;
    }else{
        self.leftButton.selected = NO;
        self.rightButton.selected = YES;
        center.x = self.rightButton.center.x;
    }
    _selectedIndex = index;
    [UIView animateWithDuration:0.4 animations:^{
        self.underLine.center = center;
    }];
}
@end
