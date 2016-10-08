//
//  ZTHPhoneMenu.m
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHPhoneMenu.h"
#import <Foundation/Foundation.h>
#import <AddressBookUI/ABNewPersonViewController.h>
#import <AddressBookUI/ABPersonViewController.h>
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <UIAlertView+Blocks.h>
#import <UIActionSheet+Blocks.h>
@interface ZTHPhoneMenu()<
ABNewPersonViewControllerDelegate,
ABPeoplePickerNavigationControllerDelegate>
@end
@implementation ZTHPhoneMenu{
    //必须是weak类型，，如果用strong类弄传入，会造成循环引用，使得控制器一直得不到释放
    //从而会引发一系列未可预知问题
    NSString* _o_phoneNum;//电话号码
    __weak UIViewController* _o_parentViewController;//父控制器，用来显示系统的电话簿
}
- (void)showInController:(UIViewController*)viewController phoneNumber:(NSString*)phoneNumber{
    _o_phoneNum = phoneNumber;
    _o_parentViewController = viewController;
    //判断设备是否有打电话功能
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone &&![[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"]) {
        NSString* title = [NSString stringWithFormat:@"%@\n可能是个电话号码，你可以",phoneNumber];
        [UIActionSheet showInView:_o_parentViewController.view
                        withTitle:title
                cancelButtonTitle:@"取消"
           destructiveButtonTitle:nil
                otherButtonTitles:@[@"呼叫",@"添加到通讯录",@"拷贝"]
                         tapBlock:^(UIActionSheet * __nonnull actionSheet, NSInteger buttonIndex){
                             if (buttonIndex == 0) {//呼叫电话号码
                                 if (phoneNumber && ![phoneNumber isEqualToString:@""]) {
                                     NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel://%@",phoneNumber];
                                     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
                                 }
                             }else if (buttonIndex == 1){//添加到通讯录
                                 [UIActionSheet showInView:_o_parentViewController.view
                                                 withTitle:title
                                         cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:@[@"创建新联系人",@"添加到现有联系人"]
                                                  tapBlock:^(UIActionSheet * __nonnull actionSheet, NSInteger buttonIndex){
                                                      if (buttonIndex == 0) {//创建新联系人
                                                          [self addNewPerson2AddressBook:phoneNumber];
                                                      }else if (buttonIndex == 1){//添加到现在联系人
                                                          [self addPerson2ExistPersion];
                                                      }
                                                  }];
                             }else if (buttonIndex == 2){//拷贝
                                 if (phoneNumber) {
                                     UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                                     [pasteboard setString:phoneNumber];
                                 }
                             }
                         }];
    }else{
        [UIAlertView showWithTitle:@"提示"
                           message:@"当前设备不具备拨打电话功能"
                 cancelButtonTitle:@"确定"
                 otherButtonTitles:nil
                          tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                          }];
    }
    

}
/**
 *  @author yzl, 15-09-22 10:09:23
 *
 *  创建新联系人
 *
 *  @param phoneNum 电话号码
 */
-(void)addNewPerson2AddressBook:(NSString*)phoneNum{
    @try {
        ABNewPersonViewController *picker = [[ABNewPersonViewController alloc] init];
        picker.newPersonViewDelegate = self;
        ABRecordRef tmpRecord = ABPersonCreate();
        CFTypeRef tmpPhones   = (__bridge_retained CFTypeRef)(phoneNum);
        ABMutableMultiValueRef tmpMutableMultiPhones = ABMultiValueCreateMutable(kABPersonPhoneProperty);
        ABMultiValueAddValueAndLabel(tmpMutableMultiPhones, tmpPhones, kABPersonPhoneMobileLabel, NULL);
        CFErrorRef error;
        BOOL tmpSuccess = ABRecordSetValue(tmpRecord, kABPersonPhoneProperty, tmpMutableMultiPhones, &error);
        tmpSuccess = ABRecordSetValue(tmpRecord, kABPersonPhoneProperty, tmpMutableMultiPhones, &error);
        CFRelease(tmpPhones);
        picker.displayedPerson = tmpRecord;
        CFRelease(tmpRecord);
        //        CFRelease(tmpMutableMultiPhones);
        [_o_parentViewController.navigationController pushViewController:picker animated:YES];
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@",__PRETTY_FUNCTION__,exception);
    }
    @finally {
        
    }
}
/**
 *  @author yzl, 15-10-27 08:10:10
 *
 *  把电话号码添加到已有联系人
 */
-(void)addPerson2ExistPersion{
    //如果点中的电话号码为nil 或空串，则不弹出添加到通讯录
    if (_o_phoneNum == nil || [_o_phoneNum isEqualToString:@""]) {
        return;
    }
    ABPeoplePickerNavigationController* ppnc = [[ABPeoplePickerNavigationController alloc]init];
    [ppnc.navigationBar setBarTintColor:[UIColor colorWithRed:0.259 green:0.722 blue:0.988 alpha:1.000]];
    [ppnc.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithWhite:0.961 alpha:1.000], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    ppnc.navigationBar.translucent = NO;
    //    [[UINavigationBar appearance]setBackgroundImage:[[UIImage alloc]init]
    //                                      forBarMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance]setShadowImage:[[UIImage alloc]init]];
    [ppnc.navigationBar setBackgroundImage:[[UIImage alloc]init]
                             forBarMetrics:UIBarMetricsDefault];
    [ppnc.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        //如果在IOS8系统不设置些项，点击电话时，不会返回应用，而是直拨打电话
        ppnc.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:YES];
    }
    ppnc.peoplePickerDelegate = self;
    // ppnc.displayedProperties = [NSArray arrayWithObject:[NSNumber numberWithInt:kABPersonPhoneProperty]];
    [_o_parentViewController presentViewController:ppnc animated:YES completion:^{
    }];
}

#pragma mark - ABNewPersonViewControllerDelegate
- (void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person{
    [_o_parentViewController.navigationController popViewControllerAnimated:YES];
    //[newPersonView dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - ABPeoplePickerNavigationControllerDelegate
-(void)addPersonOnExistAddress:(ABRecordRef)person newPhoneNum:(NSString*)newPhoneNum{
    ABNewPersonViewController *picker = [[ABNewPersonViewController alloc] init];
    picker.newPersonViewDelegate = self;
    //        ABRecordRef tmpRecord = ABPersonCreate();
    CFTypeRef tmpPhones = (__bridge_retained CFTypeRef)(newPhoneNum);
    //把原先的电话号码加进去
    ABMultiValueRef oldPhones = ABRecordCopyValue(person, kABPersonPhoneProperty);
    ABMutableMultiValueRef tmpMutableMultiPhones = ABMultiValueCreateMutableCopy(oldPhones);
    ABMultiValueAddValueAndLabel(tmpMutableMultiPhones, tmpPhones, kABPersonPhoneMobileLabel, NULL);
    CFErrorRef error;
    BOOL tmpSuccess = ABRecordSetValue(person, kABPersonPhoneProperty, tmpMutableMultiPhones, &error);
    if (!tmpSuccess) {
        [UIAlertView showWithTitle:@"提示" message:@"添加电话号码失败" cancelButtonTitle:@"确定" otherButtonTitles:nil tapBlock:nil];
        return;
    }
    CFRelease(tmpPhones);
    picker.displayedPerson = person;
    // CFRelease(tmpRecord);
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:picker];
    [nav.navigationBar setBarTintColor:[UIColor colorWithRed:0.259 green:0.722 blue:0.988 alpha:1.000]];
    [nav.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithWhite:0.961 alpha:1.000], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    nav.navigationBar.translucent = NO;
    //    [[UINavigationBar appearance]setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance]setShadowImage:[[UIImage alloc]init]];
    [nav.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [nav.navigationBar setShadowImage:[[UIImage alloc]init]];
    //[self presentViewController:nav animated:YES completion:nil];
    [_o_parentViewController.navigationController pushViewController:picker animated:YES];
}
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    [self addPersonOnExistAddress:person newPhoneNum:_o_phoneNum];
    return NO;
}
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [peoplePicker dismissViewControllerAnimated:YES completion:^{
    }];
}
#ifdef __IPHONE_8_0
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person{
    @try {
        [self addPersonOnExistAddress:person newPhoneNum:_o_phoneNum];
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@",__PRETTY_FUNCTION__,exception);
    }
    @finally {
        
    }
}
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
}
#endif

@end
