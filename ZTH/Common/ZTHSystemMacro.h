//
//  ZTHSystemMicro.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#ifndef ZTHSystemMicro_h
#define ZTHSystemMicro_h

///------
/// 生成单例的宏
///------

#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)getInstance;

#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)getInstance { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS8_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

#define IOS7_OR_EARLIER		( !IOS8_OR_LATER )
#define IOS6_OR_EARLIER		( !IOS7_OR_LATER )
#define IOS5_OR_EARLIER		( !IOS6_OR_LATER )
#define IOS4_OR_EARLIER		( !IOS5_OR_LATER )
#define IOS3_OR_EARLIER		( !IOS4_OR_LATER )

#define IS_SCREEN_4_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_35_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS7_OR_LATER		(NO)
#define IOS6_OR_LATER		(NO)
#define IOS5_OR_LATER		(NO)
#define IOS4_OR_LATER		(NO)
#define IOS3_OR_LATER		(NO)

#define IS_SCREEN_4_INCH	(NO)
#define IS_SCREEN_35_INCH	(NO)
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

// 判断iPhone4
#define IS_IPHONE_4s       CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(640, 960))
// 判断iPhone5
#define IS_IPHONE_5s       CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(640, 1136))
// 判断iPhone6
#define IS_IPHONE_6       CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(750, 1334))
// 判断iPhone6p
#define IS_IPHONE_6P   CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(1242, 2208))

//十六进制颜色值转换成UIColor
#define UIColorFromRGBV(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//RGB转换成UIColor
#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:((float)r)/255.0 green:((float)g)/255.0 blue:((float)b)/255.0 alpha:1.0]
//RGB alpha转换成UIColor
#define UIColorFromRGBA(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define VIEW_X(v)               (v).frame.origin.x
#define VIEW_Y(v)               (v).frame.origin.y
#define VIEW_WIDTH(v)           (v).frame.size.width
#define VIEW_HEIGHT(v)          (v).frame.size.height

///---------
/// block 宏
///---------
#define kWeakSelf               @weakify(self);
#define kStrongSelf             @strongify(self);
#define weakify(object)         autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#define strongify(object)       try{} @finally{} __typeof__(object) object = weak##_##object;

#define UISCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define UISCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#endif /* ZTHSystemMicro_h */
