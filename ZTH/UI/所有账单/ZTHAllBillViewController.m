//
//  ZTHAllBillViewController.m
//  ZTH
//
//  Created by yzl on 16/7/12.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHAllBillViewController.h"
#import "ZTHAlbumVerifySwitchView.h"
@interface ZTHAllBillViewController ()
/*
 * 切换视图
 */
@property (strong,nonatomic) ZTHAlbumVerifySwitchView* switchView;
@end

@implementation ZTHAllBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - setter & getter 
- (ZTHAlbumVerifySwitchView*)switchView{
    if (!_switchView) {
        kWeakSelf;
        void (^buttonBlock)(NSInteger buttonIndex) = ^(NSInteger buttonIndex) {
            kStrongSelf;
        };
        _switchView = [[ZTHAlbumVerifySwitchView alloc]initWithFrame:CGRectMake(0, 0, 150, 40)
                                                              titles:@[@"收费账单",@"退费账单"]
                                                          imageNames:nil
                                                         buttonBlock:buttonBlock];
        _switchView.backgroundColor = [UIColor clearColor];
        _switchView.line.hidden = YES;
        _switchView.selectColor = [UIColor whiteColor];
        _switchView.unselectColor = [UIColor colorWithWhite:1 alpha:0.8];
    }
    return _switchView;

}

#pragma mark - method
- (void)setNav{
    
}
@end
