//
//  ZTHAlbumVerifySwitchView.h
//  ztjyyd
//
//  Created by yzl on 16/6/15.
//  Copyright © 2016年 szy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTHAlbumVerifySwitchView : UIView
@property (strong, nonatomic) UIColor *selectColor;
@property (strong, nonatomic) UIColor *unselectColor;
@property (strong, nonatomic) UILabel* line;

/*
 * 选中button索引
 */
@property (assign,nonatomic,readonly) NSInteger selectedIndex;

- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray*)titles
                   imageNames:(NSArray*)imageNames
                  buttonBlock:(void(^)(NSInteger buttonIndex))buttonBlock;
/*!
 *  @author yzl
 *
 *  @brief 选中项切换并且执行切换之后的block操作
 *
 *  @param index index description
 */
- (void)selectSwitchViewAtIndex:(NSInteger)index;
/*!
 *  @author yzl
 *
 *  @brief 只对切换界面进行选种，不执行block操作
 *
 *  @param index index description
 */
- (void)onlySelectSwitchViewAtIndex:(NSInteger)index;
@end
