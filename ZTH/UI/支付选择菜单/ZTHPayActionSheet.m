//
//  ZTHPayActionSheet.m
//  ztjyyd
//
//  Created by yzl on 16/7/12.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "ZTHPayActionSheet.h"
#import "ZTHPaySheetCell.h"

@interface ZTHPayActionSheet()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
/*
 * 列表
 */
@property (strong,nonatomic) UITableView* tableView;
/*
 * 高度 缓存
 */
@property (strong,nonatomic) NSMutableDictionary* heightDictionary;
@end


@implementation ZTHPayActionSheet{
    ZTHPaySheetTitleViewStyle _titleViewStyle;  //标题风格
    NSString* _title;                           //正标题内容
    NSString* _detailTitle;                     //副标题内容
    NSInteger _sectionNum;                      //一共有多少组
    CGFloat   _tableHeight;                     //列表高度

}
- (instancetype)initWithTitleViewStyle:(ZTHPaySheetTitleViewStyle)titleViewStyle
                                 title:(NSString*)title
                           detailTitle:(NSString*)detailTitle{
    self = [super initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT)];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.129 alpha:0.670];
        _titleViewStyle = titleViewStyle;
        _title = title;
        _detailTitle = detailTitle;
        _tableHeight = 0;
        [self addSubview:self.tableView];
        
        UITapGestureRecognizer* tapGst = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGstAction:)];
        tapGst.delegate = self;
        [self addGestureRecognizer:tapGst];
    }
    return self;
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    _sectionNum = 0;
    if ([self.delegate respondsToSelector:@selector(numberOfSectionsInActionSheet:)]) {
      _sectionNum =  [self.delegate numberOfSectionsInActionSheet:self];
    }
    return _sectionNum + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section != _sectionNum) {
        NSInteger rows = 0;
        if ([self.delegate respondsToSelector:@selector(actionSheet:numberOfRowsInSection:)]) {
            rows = [self.delegate actionSheet:self numberOfRowsInSection:section];
        }
        return rows;
    }else{
        return 1; //取消栏
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.heightDictionary setObject:@(50) forKey:[self keyForIndexPath:indexPath]];
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        if (_titleViewStyle == ZTHPaySheetTitleViewDetailStyle) {
            [self.heightDictionary setObject:@(60) forKey:[self keyForSection:section]];
            return 60;
        }
        [self.heightDictionary setObject:@(40) forKey:[self keyForSection:section]];
        return 40;
    }else{
        [self.heightDictionary setObject:@(10) forKey:[self keyForSection:section]];
        return 10;
    }
    return 0;
    
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        CGFloat height = 0;
        if (_titleViewStyle == ZTHPaySheetTitleViewDetailStyle) {
            height = 60;
        }
        height = 40;
         ZTHPaySheetTitleView* titleView = [[ZTHPaySheetTitleView alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, height) titleViewStyle:_titleViewStyle];
        titleView.backgroundColor = UIColorFromRGBV(0xeeeeee);
        titleView.mainTitleLabel.text = _title;
        if (_detailTitle) {
            titleView.detailLabel.text = _detailTitle;
        }
        return titleView;
    }else{
        UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 10)];
        view.backgroundColor = UIColorFromRGBV(0xeeeeee);
        return view;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section != _sectionNum) {
        ZTHPaySheetCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ZTHPaySheetCell"];
        if (!cell) {
            cell = [[ZTHPaySheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZTHPaySheetCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ([self.delegate respondsToSelector:@selector(actionSheet:attributeTitleForIndexPath:)]) {
            NSAttributedString* attributeString = [self.delegate actionSheet:self attributeTitleForIndexPath:indexPath];
            if (attributeString) {
                cell.contentLabel.attributedText = attributeString;
            }else if ([self.delegate respondsToSelector:@selector(actionSheet:titleForIndexPath:)]){
                NSString* string = [self.delegate actionSheet:self titleForIndexPath:indexPath];
                if (string) {
                    cell.contentLabel.text = string;
                }else{
                    cell.contentLabel.text = @"";
                }
            }

        }else if ([self.delegate respondsToSelector:@selector(actionSheet:titleForIndexPath:)]){
            NSString* string = [self.delegate actionSheet:self titleForIndexPath:indexPath];
            if (string) {
                cell.contentLabel.text = string;
            }else{
                cell.contentLabel.text = @"";
            }
        }
        UIColor* textColor = nil;

        if ([self.delegate respondsToSelector:@selector(actionSheet:titleColorForIndexPath:)]) {
            textColor = [self.delegate actionSheet:self titleColorForIndexPath:indexPath];
        }
        if (!textColor) {
            textColor = UIColorFromRGBV(0x333333);
        }
        cell.contentLabel.textColor = textColor;
        return cell;

    }else{
        ZTHPaySheetCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cancel"];
        if (!cell) {
            cell = [[ZTHPaySheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cancel"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.contentLabel.textColor = [UIColor colorWithRed:0.176 green:0.659 blue:0.953 alpha:1.000];
        cell.contentLabel.text = @"取消";
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismiss];

    if ([self.delegate respondsToSelector:@selector(actionSheet:didSelectedIndexPath:)]) {
        [self.delegate actionSheet:self didSelectedIndexPath:indexPath];
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (touch.view == self) {
        return YES;
    }
    return NO;
}
#pragma mark - setter & getter 

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 0)];
        _tableView.bounces = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = UIColorFromRGBV(0Xdedede);
    }
    return _tableView;
}

- (NSMutableDictionary*)heightDictionary{
    if (!_heightDictionary) {
        _heightDictionary = [[NSMutableDictionary alloc]init];
    }
    return _heightDictionary;
}

- (void)tapGstAction:(UITapGestureRecognizer*)gst{
    [self dismiss];
}

//- (void)setCurSelIndexPath:(NSIndexPath *)curSelIndexPath{
//    
//    if (!curSelIndexPath || (curSelIndexPath.section >= _sectionNum)) {
//        return;
//    }
//    _curSelIndexPath = curSelIndexPath;
//    [self.tableView selectRowAtIndexPath:_curSelIndexPath animated:NO scrollPosition:(UITableViewScrollPositionNone)];
//    
//}

#pragma mark - method 

- (void)initUI{
    [self addSubview:self.tableView];
}

- (void)showInView:(UIView *)view{
    UIWindow* viewWindow = view.window;
    self.hidden = NO;
    [self.tableView reloadData];
    [self.tableView selectRowAtIndexPath:self.curSelIndexPath animated:NO scrollPosition:(UITableViewScrollPositionNone)];

    _tableHeight = [self heightOfTableView];;

    CGRect frame = CGRectMake(0, UISCREEN_HEIGHT , UISCREEN_WIDTH, _tableHeight);
    self.tableView.frame = frame;
    
    [viewWindow addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = CGRectMake(0, UISCREEN_HEIGHT - _tableHeight , UISCREEN_WIDTH, _tableHeight);
        self.tableView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)dismiss{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = CGRectMake(0, UISCREEN_HEIGHT , UISCREEN_WIDTH, _tableHeight);
        self.tableView.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (NSString*)keyForSection:(NSInteger)section{
    NSString* key = [NSString stringWithFormat:@"%ld",section];
    return key;
}

- (NSString*)keyForIndexPath:(NSIndexPath*)indexPath{
    NSString* key = [NSString stringWithFormat:@"%ld_%ld",indexPath.section,indexPath.row];
    return key;
}

- (CGFloat)heightOfTableView{
    __block CGFloat height = 0;
    [self.heightDictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        height += [obj floatValue];
    }];
    return height;
}
@end
