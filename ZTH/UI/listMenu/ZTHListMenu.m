//
//  ZTHListMenu.m
//  ZTH
//
//  Created by yzl on 16/8/15.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHListMenu.h"
#import "ZTHListMenuCell.h"
#define MENU_ITEM_HEIGHT 40

@interface ZTHListMenu()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
/*
 * 数据源
 */
@property (strong,nonatomic) NSMutableArray* dataSource;
///*!
// *  @author yzl, 16-03-03 09:03:38
// *
// *  @brief 菜单X位置
// */
//@property (assign, nonatomic) CGFloat offsetX;
///*
// * 菜单Y位置
// */
//@property (assign,nonatomic) CGFloat offsetY;
/*
 * 菜单宽度
 */
@property (assign,nonatomic) CGFloat menuWidth;
/*
 * 菜单高度
 */
//@property (assign,nonatomic) CGFloat menuHeight;
@end
@implementation ZTHListMenu

- (instancetype)initWithMenuItems:(NSMutableArray*)menuItems menuWidth:(CGFloat)menuWidth{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.menuWidth = menuWidth;
        self.dataSource = [menuItems mutableCopy];
        [self initUI];
        UITapGestureRecognizer* tapGst = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMenu)];
        tapGst.delegate = self;
        [self addGestureRecognizer:tapGst];
    }
    return self;
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
    
    ZTHListMenuItemInfo* info = [self.dataSource objectAtIndex:indexPath.row];
    if (info.imageName) {
        cell.imageView.image = [UIImage imageNamed:info.imageName];
    }
    cell.textLabel.text = info.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZTHListMenuItemInfo* info = [self.dataSource objectAtIndex:indexPath.row];
    if (info.eventBlock) {
        info.eventBlock();
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (touch.view == self) {
        return YES;
    }
    return NO;
}

#pragma mark - method
- (void)initUI{
    [self addSubview:self.tableMenu];
    [self.tableMenu reloadData];
    
}

- (CGRect)menuFrame {
    CGFloat menuX = CGRectGetWidth(self.frame) - 10 - self.menuWidth;
    CGFloat menuY = 74;
    CGFloat width = self.menuWidth;
    CGFloat heigh = MENU_ITEM_HEIGHT * self.dataSource.count;
    return (CGRect){menuX,menuY,width,heigh};
}

- (void)show{
    UIWindow * window = [[[UIApplication sharedApplication] windows] firstObject];
    self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    self.tableMenu.backgroundColor = [UIColor whiteColor];
    [window addSubview:self];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.tableMenu.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];

}
- (void)hideMenu{
    [UIView animateWithDuration:0.15 animations:^{
        self.tableMenu.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - setter & getter 
- (UITableView*)tableMenu{
    if (!_tableMenu) {
        _tableMenu = [[UITableView alloc]initWithFrame:[self menuFrame] style:UITableViewStylePlain];
        _tableMenu.dataSource = self;
        _tableMenu.delegate = self;
        _tableMenu.layer.cornerRadius = 10.0f;
        _tableMenu.layer.position    = CGPointMake(CGRectGetMaxX(_tableMenu.frame), CGRectGetMinY(_tableMenu.frame));
        _tableMenu.layer.anchorPoint = CGPointMake(1.0, 0);
        _tableMenu.transform = CGAffineTransformIdentity;
        _tableMenu.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        _tableMenu.rowHeight = MENU_ITEM_HEIGHT;
        _tableMenu.backgroundColor = [UIColor whiteColor];
        _tableMenu.bounces = NO;
    }
    return _tableMenu;
}
@end
