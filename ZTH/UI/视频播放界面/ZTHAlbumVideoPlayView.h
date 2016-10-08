//
//  ZTHAlbumVideoPlayView.h
//  ZTH
//
//  Created by yzl on 16/7/1.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VIMVideoPlayerView.h>
#import <VIMVideoPlayer.h>
#import "ZTHAlbumVideoToolBar.h"

@interface ZTHAlbumVideoPlayView : UIView
/*
 * 视频播放界面
 */
@property (strong,nonatomic) VIMVideoPlayerView* videoPlayView;
/*
 * 视频播放工具栏
 */
@property (strong,nonatomic) ZTHAlbumVideoToolBar* toolBar;
///*
// * 关闭按钮
// */
//@property (strong,nonatomic) UIButton* closeButton;

/*
 * 视频播放地十
 */
@property (strong,nonatomic) NSURL* url;

/*
 * 播放按钮
 */
@property (strong,nonatomic) UIButton* playButton;

/*
 * 显示时间长度
 */
@property (strong,nonatomic) UILabel* timeDurationLabel;
/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief 全屏按钮被点击
 */
@property (copy, nonatomic) void(^fullScreenBlock)(NSURL* url);
- (void)play;
- (void)pause;
@end
