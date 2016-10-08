//
//  ZTHAlbumVideoToolBar.h
//  ZTH
//
//  Created by yzl on 16/7/1.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTHAlbumVideoToolBar : UIView
/*
 * 进度条
 */
@property (strong,nonatomic) UISlider* playProgress;
/*
 * 当前播放到的时间显示
 */
@property (strong,nonatomic) UILabel* currentTimeLabel;
/*
 * 显示视频长度的时间
 */
@property (strong,nonatomic) UILabel* maxTimeLabel;
/*
 * 全屏或关闭全屏的按钮
 */
@property (strong,nonatomic) UIButton* fullScreenButton;

/*
 * 最大时间
 */
@property (assign,nonatomic) double maxValue;
/*
 * 当前播放到的时间
 */
@property (assign,nonatomic) double curDuration;
@end
