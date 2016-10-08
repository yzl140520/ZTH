//
//  ZTHPayActionSheet.h
//  ztjyyd
//
//  Created by yzl on 16/7/12.
//  Copyright © 2016年 szy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTHPaySheetTitleView.h"
@protocol ZTHPayActionSheetDelegate;
@interface ZTHPayActionSheet : UIView
/*!
 *  @author yzl
 *
 *  @brief 根据标题初始化菜单
 *
 *  @param titleViewStyle 标题的类型：有无副标题
 *  @param title          正标题内容，不能为nil
 *  @param detailTitle    副标题内容，可以为nil
 *
 *  @return return value description
 */
- (instancetype)initWithTitleViewStyle:(ZTHPaySheetTitleViewStyle)titleViewStyle
                                 title:(NSString*)title
                           detailTitle:(NSString*)detailTitle;

/*
 * 代理
 */
@property (weak,nonatomic) id<ZTHPayActionSheetDelegate> delegate;

/*
 * 显示时，要选中的行
 */
@property (strong,nonatomic) NSIndexPath* curSelIndexPath;
- (void)showInView:(UIView*)view;
@end

@protocol ZTHPayActionSheetDelegate <NSObject>

@required
/*!
 *  @author yzl
 *
 *  @brief 取消栏不算在内，一共有多少组
 *
 *  @param actionSheet actionSheet description
 *
 *  @return return value description
 */
- (NSInteger)numberOfSectionsInActionSheet:(ZTHPayActionSheet*)actionSheet;

- (NSInteger)actionSheet:(ZTHPayActionSheet*)actionSheet
   numberOfRowsInSection:(NSInteger)section;

- (NSString*)actionSheet:(ZTHPayActionSheet*)actionSheet
       titleForIndexPath:(NSIndexPath*)indexPath;

@optional
/*!
 *  @author yzl
 *
 *  @brief 有时候一串字符串，文字大小颜色不一样，此时最好用富广西
 *
 *  @param actionSheet actionSheet description
 *  @param indexPath   indexPath description
 *
 *  @return return value description
 */
- (NSAttributedString*)actionSheet:(ZTHPayActionSheet*)actionSheet
        attributeTitleForIndexPath:(NSIndexPath*)indexPath;

- (void)actionSheet:(ZTHPayActionSheet*)actionSheet didSelectedIndexPath:(NSIndexPath*)indexPath;

- (UIColor*)actionSheet:(ZTHPayActionSheet*)actionSheet
 titleColorForIndexPath:(NSIndexPath*)indexPath;
@end
