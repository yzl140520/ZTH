//
//  ZTHPaySheetTitleView.h
//  ztjyyd
//
//  Created by yzl on 16/7/12.
//  Copyright © 2016年 szy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZTHPaySheetTitleViewStyle) {
    ZTHPaySheetTitleViewNormalStyle, //正常没副标题
    ZTHPaySheetTitleViewDetailStyle, //有副标题
};

@interface ZTHPaySheetTitleView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleViewStyle:(ZTHPaySheetTitleViewStyle)titleViewStyle;

/*
 * 正标题
 */
@property (strong,nonatomic) UILabel* mainTitleLabel;
/*
 * 副标题
 */
@property (strong,nonatomic) UILabel* detailLabel;
@end
