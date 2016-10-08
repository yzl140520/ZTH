//
//  ViewController.m
//  ZTH
//
//  Created by yzl on 16/6/2.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+ZLExtension.h"
#import "NSString+ZLString2Date.h"
#import "ZTHSandbox.h"
#import <YYLabel.h>
#import "UIImage+ZTHRoundCorner.h"
#import <UIAlertView+Blocks.h>
#import "ZTHNoDataView.h"
#import <YYTextAttribute.h>
#import <NSAttributedString+YYText.h>
#import <VIMVideoPlayerView.h>
#import <VIMVideoPlayer.h>
#import "ZTHAlbumVideoToolBar.h"
#import "ZTHAlbumVideoPlayView.h"
#import "ZTHPerson.h"
//#import <YYTextExampleHelper.h>
//#import <yy>
#import "ZTHPayActionSheet.h"
#import "ZTHListMenu.h"
#import "ZTHListMenuItemInfo.h"
#import "UIColor+ZTHImage.h"
#import "ZTHPopMenuView.h"
#import "ZTHPopMenuItemInfo.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface ViewController ()<ZTHPayActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>
/*
 * 视频播放界面
 */
@property (strong,nonatomic) ZTHAlbumVideoPlayView* videoPlayView;

@property (strong, nonatomic) ZTHPayActionSheet* payActionSheet;
/*
 * <#name#>
 */
@property (strong,nonatomic) ZTHListMenu* menu;
/*
 * name
 */
@property (strong,nonatomic) ZTHPopMenuView* popMenu;
/*
 * name
 */
@property (strong,nonatomic) UITableView* tableView;
/*
 * 数据源
 */
@property (strong,nonatomic) NSMutableArray* dataSource;
/*
 * 行为
 */
@property (strong,nonatomic) NSMutableArray* actions;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    [self initUI];
//    _person = [[ZTHPerson alloc]init];
//    [_person addObserver:self forKeyPath:@"persons" options:NSKeyValueObservingOptionNew context:nil];
//    
//    [_person addObject:@"ddd"];
//    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(10, 300, 150, 30)];
//    button.backgroundColor = [UIColor redColor];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//
//
//    ZTHNoDataView* noDataView = [ZTHNoDataView noDataViewWithFrame:CGRectMake(0, 0, 320, 250) image:nil message:@"您还没加入任何学校\n加入学校或联系园长/当地服务商加入，体验更精彩" detailMessage:nil buttonTitle:@"立即添加" buttonActionBlock:^{
//        
//    }];
//    noDataView.backgroundColor = [UIColor colorWithRed:0.176 green:0.651 blue:0.961 alpha:1.000];
//    [noDataView setMessageColor:[UIColor whiteColor]];
//    [noDataView setButtonTitleColor:[UIColor colorWithRed:0.176 green:0.651 blue:0.961 alpha:1.000] forState:UIControlStateNormal];
//    UIImage* image = [[UIColor whiteColor]zth_image];
//    UIImage* stretchImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:0];
//    [noDataView setButtonBackgroundImage:stretchImage forState:UIControlStateNormal];
//    [noDataView setButtonLayerCornerRadius:8];
//    [noDataView setButtonFrame:CGRectMake(0, 0, 210, 45)];
//    [self.view addSubview:noDataView];
//    
//    ZTHNoDataView* noDataView2 = [ZTHNoDataView noDataViewWithFrame:CGRectMake(0, CGRectGetMaxY(noDataView.frame) + 10, 320, 320) image:[UIImage imageNamed:@"classAlbum_pic2"] message:@"未关联校园的园丁登录时仅可用系统基础功能" detailMessage:nil buttonTitle:@"添加学校" buttonActionBlock:nil];
//    [noDataView setMessageColor:[UIColor whiteColor]];
//    [self.view addSubview:noDataView2];
    
//    NSDate* date = [NSDate date];
//    BOOL istoday = [date zth_isToday];
//    NSString* string = [date formateForSpecialTwo];
////
//     NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//     NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
////    dateFormatter.locale = [NSLocale systemLocale];
////    dateFormatter.calendar = gregorian;
//    NSString* dateString = @"2016-06-25 15:20:35";
//    NSDate* date2 = [dateFormatter dateFromString:dateString];
//    NSString* string21 = [dateFormatter stringFromDate:date2];
    [self initData];
    [self initUI];
   
}


- (void)initUI{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];
}

- (void)initData{
    self.dataSource = [[NSMutableArray alloc]initWithObjects:@"列表没有数据的情况下显示默认界面",@"ZTHPayActionSheet",@"ZTHPopMenuView",@"ZTHListMenu", nil];
    
    
    void(^block1)(void) = ^{
    
    };
    
    void(^block2)(void) = ^{
        self.payActionSheet.curSelIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.payActionSheet showInView:self.view];

    };
    void(^block3)(void) = ^{
        NSMutableArray* items = [[NSMutableArray alloc]init];
        ZTHPopMenuItemInfo* itemInfo1 = [[ZTHPopMenuItemInfo alloc]init];
        itemInfo1.imageName = @"album_menu_icon_camera_selected";
        itemInfo1.title = @"拍照";
        
        ZTHPopMenuItemInfo* itemInfo2 = [[ZTHPopMenuItemInfo alloc]init];
        itemInfo2.imageName = @"album_menu_icon_photo_selected";
        itemInfo2.title = @"相册";
        
        ZTHPopMenuItemInfo* itemInfo3 = [[ZTHPopMenuItemInfo alloc]init];
        itemInfo3.imageName = @"album_menu_icon_video_selected";
        itemInfo3.title = @"视频";
        
        ZTHPopMenuItemInfo* itemInfo4 = [[ZTHPopMenuItemInfo alloc]init];
        itemInfo4.imageName = @"album_menu_icon_text_selected";
        itemInfo4.title = @"文字";
        
        ZTHPopMenuItemInfo* itemInfo5 = [[ZTHPopMenuItemInfo alloc]init];
        itemInfo5.imageName = @"album_menu_icon_growth_selected";
        itemInfo5.title = @"身高体重";
        

        
        [items addObject:itemInfo1];
        [items addObject:itemInfo2];
        [items addObject:itemInfo3];
        
        [items addObject:itemInfo4];
        
        [items addObject:itemInfo5];
        
        //    [items addObject:itemInfo1];
        
        if (!self.popMenu) {
            self.popMenu = [[ZTHPopMenuView alloc]initWithMenuItems:items buttonAction:^(NSInteger buttonIndex) {
                
            }];
        }
        
        
        
        [self.popMenu show];

        
    };
    
    void(^block4)(void) = ^{
        NSMutableArray *obj = [NSMutableArray array];
        
        for (NSInteger i = 0; i < [self titles].count; i++) {
            
            ZTHListMenuItemInfo * info = [ZTHListMenuItemInfo new];
            info.imageName = [self images][i];
            info.title = [self titles][i];
            [obj addObject:info];
        }
        
        _menu = [[ZTHListMenu alloc]initWithMenuItems:obj menuWidth:150];
        [_menu show];
    };
    self.actions = [[NSMutableArray alloc]initWithObjects:block1,block2,block3,block4,nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSString* string1 = @"http://zthome.qiniudn.com/MInbuebVdR9HBibfxHcouSuqYAs=/FhMZcJUZNahLQiHCektbdi-E-_xm";
    NSURL* url = [NSURL URLWithString:string1];//[NSURL URLWithString:@"http://zthome.qiniudn.com/MInbuebVdR9HBibfxHcouSuqYAs=/lpSSlZ0gd0BBtbr0h8IN_dynvBL5"];
    self.videoPlayView.url = url;

}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInActionSheet:(ZTHPayActionSheet*)actionSheet{
    return 2;
}

- (NSInteger)actionSheet:(ZTHPayActionSheet*)actionSheet
   numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 2;
    }
}

- (NSString*)actionSheet:(ZTHPayActionSheet*)actionSheet
       titleForIndexPath:(NSIndexPath*)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                return @"微信支付";
                break;
            case 1:
                return @"支付宝支付";
            case 2:
                return @"余额支付(余额不足)";
            default:
                return @"";
                break;
        }
    }else{
        switch (indexPath.row) {
            case 0:
                return @"分享给他人支付";
                break;
            case 1:
                return @"支付二维码";
            case 2:
                return @"余额支付(余额不足)";
            default:
                return @"";
                break;
        }

    }
}

- (NSAttributedString*)actionSheet:(ZTHPayActionSheet *)actionSheet attributeTitleForIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 2) {
        NSString* string = @"余额支付(剩余￥8888.0)";
        NSRange subRange = [string rangeOfString:@"(剩余￥8888.0)"];
        NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc]initWithString:@"余额支付(剩余￥8888.0)"];
        [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:subRange];
        return attributeString;
    }
    return nil;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.font = fontWithSize(17);
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    void(^block)(void) = [self.actions objectAtIndex:indexPath.row];
    if (block) {
        block();
    }
}

#pragma mark - setter & getter 

- (ZTHAlbumVideoPlayView*)videoPlayView{
    if (!_videoPlayView) {
        _videoPlayView = [[ZTHAlbumVideoPlayView alloc]initWithFrame:CGRectMake(0, 100, 320, 280)];
        _videoPlayView.backgroundColor = [UIColor blackColor];
    }
    return _videoPlayView;
}


- (ZTHPayActionSheet*)payActionSheet{
    if (!_payActionSheet) {
        _payActionSheet = [[ZTHPayActionSheet alloc]initWithTitleViewStyle:ZTHPaySheetTitleViewNormalStyle title:@"请选择付款方式" detailTitle:@"线下请联系老师"];
        _payActionSheet.delegate = self;
    }
    return _payActionSheet;
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray*)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
#pragma mark - method

- (NSArray *) titles {
    return @[@"扫一扫",
             @"加好友",
             @"创建讨论组",
             @"发送到电脑",
             @"面对面快传",
             @"收钱"];
}

- (NSArray *) images {
    return @[@"right_menu_QR@3x",
             @"right_menu_addFri@3x",
             @"right_menu_multichat@3x",
             @"right_menu_sendFile@3x",
             @"right_menu_facetoface@3x",
             @"right_menu_payMoney@3x"];
}


@end
