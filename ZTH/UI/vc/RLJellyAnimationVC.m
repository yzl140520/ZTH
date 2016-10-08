//
//  RLJellyAnimationVC.m
//  ZTH
//
//  Created by yzl on 16/10/8.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "RLJellyAnimationVC.h"
#import "RLJellyAnimationView.h"

@interface RLJellyAnimationVC ()

@end

@implementation RLJellyAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    RLJellyAnimationView* jellyView = [[RLJellyAnimationView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:jellyView];
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

@end
