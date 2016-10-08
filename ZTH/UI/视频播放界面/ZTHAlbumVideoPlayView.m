//
//  ZTHAlbumVideoPlayView.m
//  ZTH
//
//  Created by yzl on 16/7/1.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHAlbumVideoPlayView.h"
#import <AVFoundation/AVFoundation.h>
@interface ZTHAlbumVideoPlayView()<VIMVideoPlayerDelegate,VIMVideoPlayerViewDelegate>
@property (nonatomic, strong) NSTimer * durationTimer;

@end
@implementation ZTHAlbumVideoPlayView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)dealloc{
    [self.durationTimer invalidate];
}
#pragma mark - VideoPlayerDelegate

- (void)videoPlayerIsReadyToPlayVideo:(VIMVideoPlayer *)videoPlayer
{
    
    [self setProgressSliderMaxMinValues];
    [self monitorVideoPlayback];
    [self startDurationTimer];
//    if ([self.delegate respondsToSelector:@selector(videoPlayerViewIsReadyToPlayVideo:)])
//    {
//        [self.delegate videoPlayerViewIsReadyToPlayVideo:self];
//    }
}
//
- (void)videoPlayerDidReachEnd:(VIMVideoPlayer *)videoPlayer
{

    [self monitorVideoPlayback];
    [self stopDurationTimer];
    self.toolBar.curDuration = 0;
    [self.videoPlayView.player seekToTime:floor(0)];

    [self pause];
    
}

- (void)videoPlayer:(VIMVideoPlayer *)videoPlayer timeDidChange:(CMTime)cmTime
{

}

- (void)videoPlayer:(VIMVideoPlayer *)videoPlayer loadedTimeRangeDidChange:(float)duration
{

}

#pragma mark - setter & getter

- (VIMVideoPlayerView*)videoPlayView{
    if (!_videoPlayView) {
        _videoPlayView = [[VIMVideoPlayerView alloc]initWithFrame:CGRectMake(0, 100, 320, 170)];
        _videoPlayView.backgroundColor = [UIColor blackColor];
        _videoPlayView.delegate = self;
        _videoPlayView.player.delegate = self;
    }
    return _videoPlayView;
}

- (ZTHAlbumVideoToolBar*)toolBar{
    if (!_toolBar) {
        _toolBar = [[ZTHAlbumVideoToolBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _toolBar.backgroundColor = [UIColor colorWithWhite:0.500 alpha:0.220];
        [_toolBar.playProgress addTarget:self action:@selector(progressSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_toolBar.playProgress addTarget:self action:@selector(progressSliderTouchBegan:) forControlEvents:UIControlEventTouchDown];
        [_toolBar.playProgress addTarget:self action:@selector(progressSliderTouchEnded:) forControlEvents:UIControlEventTouchUpInside];
        [_toolBar.playProgress addTarget:self action:@selector(progressSliderTouchEnded:) forControlEvents:UIControlEventTouchUpOutside];
        [_toolBar.playProgress addTarget:self action:@selector(progressSliderTouchEnded:) forControlEvents:UIControlEventTouchCancel];
        [_toolBar.fullScreenButton addTarget:self action:@selector(fullScreenAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _toolBar;
}

//- (UIButton*)closeButton{
//    if (!_closeButton) {
//        _closeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 30)];
//        [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
//        _closeButton.titleLabel.textColor = [UIColor whiteColor];
//        _closeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//        _closeButton.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.000];
//    }
//    return _closeButton;
//}

- (void)setUrl:(NSURL *)url{
    _url = [url copy];
    self.videoPlayView.player.muted = NO;
    self.videoPlayView.player.looping = NO;
    [self.videoPlayView.player setVolume:1.0];
    [self.videoPlayView.player setURL:_url];
}

- (UIButton*)playButton{
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setImage:[UIImage imageNamed:@"视频播放_video_play"] forState:UIControlStateNormal];
        _playButton.bounds = CGRectMake(0, 0, 100, 100);
        [_playButton addTarget:self action:@selector(playButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}

- (void)fullScreenAction{
    if (self.fullScreenBlock) {
        self.fullScreenBlock(self.url);
    }
}

- (UILabel*)timeDurationLabel{
    if (!_timeDurationLabel) {
        _timeDurationLabel=[[UILabel alloc]init];
        _timeDurationLabel.backgroundColor=[UIColor clearColor];
        _timeDurationLabel.textColor=[UIColor whiteColor];
        _timeDurationLabel.font=[UIFont systemFontOfSize:15];
        _timeDurationLabel.textAlignment=NSTextAlignmentCenter;
        _timeDurationLabel.text=@"";
    }
    return _timeDurationLabel;
}
#pragma mark - reponse method
- (void)onTap:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        if (self.playButton.hidden) {
            
        }else{

            
        }
        [self.videoPlayView.player pause];
        self.playButton.hidden = !self.playButton.hidden;
    }
}

- (void)playButtonAction{
    [self startDurationTimer];
    [self play];
}

- (void)monitorVideoPlayback{
    double currentTime = floor([self currentVideoTime]);
    double totalTime = floor([self videoDuration]);
    self.toolBar.maxValue = totalTime;
    self.toolBar.curDuration = currentTime;
}

- (void)progressSliderTouchBegan:(UISlider *)slider {
    [self pause];
}

- (void)progressSliderTouchEnded:(UISlider *)slider {
    [self.videoPlayView.player seekToTime:floor(slider.value)];
    [self play];
}

- (void)progressSliderValueChanged:(UISlider *)slider {
    double currentTime = floor(slider.value);
    double totalTime = floor([self videoDuration]);
    self.toolBar.maxValue = totalTime;
    self.toolBar.curDuration = currentTime;
}

#pragma mark - method

- (void)initUI{
    [self addSubview:self.videoPlayView];
     [self.videoPlayView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.left.and.right.bottom.equalTo(self).offset(0);
     }];
    
//    [self addSubview:self.closeButton];
//    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(0);
//        make.right.equalTo(self).offset(-10);
//        make.width.equalTo(@50);
//        make.height.equalTo(@35);
//    }];
    
    [self addSubview:self.toolBar];
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.bottom.equalTo(self.videoPlayView.mas_bottom).offset(0);
        make.left.and.right.equalTo(self).offset(0);
    }];
    
    [self addSubview:self.playButton];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@100);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.centerY.equalTo(self.mas_centerY).offset(0);
    }];
    
    [self addSubview:self.timeDurationLabel];
    [self.timeDurationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.equalTo(@(15));
        make.width.equalTo(@(50));
    }];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self addGestureRecognizer:tapGesture];

}

- (void)play{
    [self.videoPlayView.player play];
    self.playButton.hidden = YES;
}
- (void)pause{
    [self.videoPlayView.player pause];
    self.playButton.hidden = NO;
}


- (void)startDurationTimer {
    if (self.durationTimer) {
        [self.durationTimer invalidate];
        self.durationTimer=nil;
    }
    self.durationTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(monitorVideoPlayback) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.durationTimer forMode:NSDefaultRunLoopMode];
}

- (void)stopDurationTimer {
    [self.durationTimer invalidate];
}

- (CGFloat)currentVideoTime{
    CMTime currentTime = self.videoPlayView.player.player.currentItem.currentTime;
    
    //转成秒数
    CGFloat currentPlayTime = (CGFloat)currentTime.value/currentTime.timescale;
    return currentPlayTime;
}

- (CGFloat)videoDuration{
    CMTime totalTime = self.videoPlayView.player.player.currentItem.duration;
    
    //因为slider的值是小数，要转成float，当前时间和总时间相除才能得到小数,因为5/10=0
    
    CGFloat duration = (CGFloat)totalTime.value/totalTime.timescale;
    return duration;
}

- (void)setProgressSliderMaxMinValues {
    
    double duration = floor([self videoDuration]);
    if (duration!=CGFLOAT_MAX) {
        self.toolBar.maxValue = duration;
        
    }
}

@end
