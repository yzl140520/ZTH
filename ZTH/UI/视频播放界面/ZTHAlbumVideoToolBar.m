//
//  ZTHAlbumVideoToolBar.m
//  ZTH
//
//  Created by yzl on 16/7/1.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHAlbumVideoToolBar.h"
@interface ZTHAlbumVideoToolBar()
@end
@implementation ZTHAlbumVideoToolBar
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

#pragma mark - setter 

- (UILabel*)currentTimeLabel{
    if (!_currentTimeLabel) {
        _currentTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        _currentTimeLabel.backgroundColor = [UIColor clearColor];
        _currentTimeLabel.font = [UIFont systemFontOfSize:10];
        _currentTimeLabel.textColor = [UIColor whiteColor];
        _currentTimeLabel.textAlignment = NSTextAlignmentCenter;
        _currentTimeLabel.text = @"00:00";
    }
    return _currentTimeLabel;
}

- (UILabel*)maxTimeLabel{
    if (!_maxTimeLabel) {
        _maxTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        _maxTimeLabel.font = [UIFont systemFontOfSize:10];
        _maxTimeLabel.textColor = [UIColor whiteColor];
        _maxTimeLabel.textAlignment = NSTextAlignmentCenter;
        _maxTimeLabel.text = @"00:00";
    }
    return _maxTimeLabel;
}

- (UISlider*)playProgress{
    if (!_playProgress) {
        _playProgress = [[UISlider alloc] init];
        [_playProgress setThumbImage:[UIImage imageNamed:@"视频播放-video-player-point"] forState:UIControlStateNormal];
        [_playProgress setMinimumTrackTintColor:[UIColor whiteColor]];
        [_playProgress setMaximumTrackTintColor:[UIColor lightGrayColor]];
        _playProgress.value = 0.f;
        _playProgress.continuous = YES;
        _playProgress.minimumValue = 0.0;

    }
    return _playProgress;
}

- (UIButton*)fullScreenButton{
    if (!_fullScreenButton) {
        _fullScreenButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fullScreenButton setImage:[UIImage imageNamed:@"视频播放_video_small-screen"] forState:UIControlStateNormal];
        [_fullScreenButton setImage:[UIImage imageNamed:@"视频播放_video_small-screen"] forState:UIControlStateSelected];
        _fullScreenButton.bounds = CGRectMake(0, 0, 40, 40);
    }
    return _fullScreenButton;

}

-(void)setMaxValue:(double)maxValue{
    double minutesRemaining = floor(maxValue / 60.0);;
    double secondsRemaining = floor(fmod(maxValue, 60.0));;
    NSString *timeRmainingString = [NSString stringWithFormat:@"%02.0f:%02.0f", minutesRemaining, secondsRemaining];
    self.maxTimeLabel.text=[NSString stringWithFormat:@"%@",timeRmainingString];
    self.playProgress.maximumValue = maxValue;

}

- (void)setCurDuration:(double)curDuration{
    double minutesElapsed = floor(curDuration / 60.0);
    double secondsElapsed = fmod(curDuration, 60.0);
    NSString *timeElapsedString = [NSString stringWithFormat:@"%02.0f:%02.0f", minutesElapsed, secondsElapsed];
    self.currentTimeLabel.text = timeElapsedString;
    self.playProgress.value = ceil(curDuration);

}
#pragma mark - method

- (void)initUI{
    [self addSubview:self.currentTimeLabel];
    [self addSubview:self.maxTimeLabel];
    [self addSubview:self.playProgress];
    [self addSubview:self.fullScreenButton];
    
    [self.currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.centerY.equalTo(self).offset(0);
        make.height.and.width.equalTo(@40);
    }];
    
    [self.fullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(0);
        make.height.and.width.equalTo(@40);
        make.centerY.equalTo(self).offset(0);
    }];
    [self.maxTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.fullScreenButton.mas_left).offset(0);
        make.centerY.equalTo(self).offset(0);
        make.height.and.width.equalTo(@40);
    }];
    
    [self.playProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(0);
        make.left.equalTo(self.currentTimeLabel.mas_right).offset(0);
        make.right.equalTo(self.maxTimeLabel.mas_left).offset(0);
        make.height.equalTo(@(CGRectGetHeight(self.frame)));

    }];
}
@end
