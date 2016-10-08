//
//  ZTHPathManager.h
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZTHPathManager : NSObject
//取得 保存这些类形的文件名字 包含路径
+ (NSString *)imageSavePath;
+ (NSString *)tempImageSavePath;
+ (NSString *)audioSavePath;
//科大讯飞，语音合成存储的路径
+ (NSString *)audioTTSSavePath;
+ (NSString *)movieSavePath;
+ (NSString *)tempMovieSavePath;
+ (NSString *)tempIMMovieSavePath;

+ (NSString *)movieSaveDictionary;
+ (NSString *)imageSaveDictionary;
+ (NSString *)tempImageSaveDictionary;

+ (NSString *)saveImageToDocumentWithPath:(NSString *)str image:(UIImage *)image;
+ (BOOL)removeDocumentFileWithPath:(NSString *)path;
+ (UIImage *)imageWithDocumentPath:(NSString *)str;
@end
