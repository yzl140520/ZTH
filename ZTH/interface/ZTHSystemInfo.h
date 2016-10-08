//
//  ZLSystemInfo.h
//  zhiliao
//
//  ZTHSystemInfo
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//

#pragma mark -




@interface ZTHSystemInfo : NSObject

DEFINE_SINGLETON_FOR_HEADER( ZTHSystemInfo )

+ (NSString *)OSVersion;
+ (NSString *)OSDes;
+ (NSString *)appVersion;
+ (NSString *)appShortVersion;
+ (NSString *)appIdentifier;
+ (NSString *)appSchema;
+ (NSString *)appSchema:(NSString *)name;
+ (NSString *)deviceModel;

+ (BOOL)isJailBroken		NS_AVAILABLE_IOS(4_0);
+ (NSString *)jailBreaker	NS_AVAILABLE_IOS(4_0);

+ (BOOL)isDevicePhone;
+ (BOOL)isDevicePad;

+ (BOOL)requiresPhoneOS;

+ (BOOL)isPhone;
+ (BOOL)isPhone35;
+ (BOOL)isPhoneRetina35;
+ (BOOL)isPhoneRetina4;
+ (BOOL)isPhoneRetina47;
+ (BOOL)isPhoneRetina5;
+ (BOOL)isPad;
+ (BOOL)isPadRetina;
+ (BOOL)isScreenSize:(CGSize)size;

+ (NSString*)mainScreenSize;
+ (NSString*)sysNetWork;
+ (NSString*)sysSp;
+ (NSString*)sysPhone;

@end
