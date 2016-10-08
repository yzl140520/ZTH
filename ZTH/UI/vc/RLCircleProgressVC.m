//
//  RLCircleProgressVC.m
//  ZTH
//
//  Created by yzl on 16/10/8.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "RLCircleProgressVC.h"
#import "RLCircleProgressView.h"
@interface RLCircleProgressVC ()
@property (assign, nonatomic) CGFloat o_percent;
@property (strong, nonatomic) RLCircleProgressView* o_progressView;
@end

@implementation RLCircleProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.o_percent = 0;
    _o_progressView = [[RLCircleProgressView alloc]initWithFrame:CGRectZero];
    _o_progressView.center = self.view.center;
    [self.view addSubview:_o_progressView];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    btn.backgroundColor = [UIColor redColor];
    btn.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
    [btn addTarget:self action:@selector(butnTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)butnTaped:(UIButton*)btn{
    self.o_percent += 0.2;
    [self.o_progressView setProgress:self.o_percent];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
