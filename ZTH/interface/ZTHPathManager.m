//
//  ZTHPathManager.m
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHPathManager.h"
#import "NSString+MD5.h"
#import "ZTHUtils.h"
@implementation ZTHPathManager
//取得 保存这些类形的文件名字 包含路径
/*  .Document
 *    -messageData
 *      -img
 */
+ (NSString *)imageSavePath{
    NSString * currentTime=[NSString stringWithFormat:@"img%u",[ZTHUtils mGetTickCount]];
    NSString * md5Str=[NSString md5:currentTime];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    //create messageData
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //create img
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/img/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/img/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString * retStr=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/img/%@",md5Str]];
    NSLog(@"imageSavePath :%@",retStr);
    return retStr;
}
//取得 保存这些类形的文件名字 包含路径
/*  .Document
 *    -messageData
 *      -tempImg
 */
+ (NSString *)tempImageSavePath{
    NSString * currentTime=[NSString stringWithFormat:@"img%u",[ZTHUtils mGetTickCount]];
    NSString * md5Str=[NSString md5:currentTime];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    //create messageData
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //create img
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempImg/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempImg/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString * retStr=[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempImg/%@",md5Str]];
    NSLog(@"imageSavePath :%@",retStr);
    return retStr;
}
/*  .Document
 *    -messageData
 *      -audio
 */
+ (NSString *)audioSavePath{
    NSString * currentTime=[NSString stringWithFormat:@"audio%u",[ZTHUtils mGetTickCount]];
    NSString * md5Str=[NSString md5:currentTime];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    //create messageData
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //create audio
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/audio/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/audio/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/audio/%@.mp3",md5Str]];
}
//科大讯飞，语音合成存储的路径
+ (NSString *)audioTTSSavePath{
    NSString * currentTime=[NSString stringWithFormat:@"audio%u",[ZTHUtils mGetTickCount]];
    NSString * md5Str=[NSString md5:currentTime];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    //create messageData
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //create audio
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/audioTTS/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/audioTTS/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/audioTTS/%@",md5Str]];
}
/*  .Document
 *    -messageData
 *      -tempMovie
 */
+ (NSString *)tempMovieSavePath{
    NSString * currentTime=[NSString stringWithFormat:@"movie%u",[ZTHUtils mGetTickCount]];
    NSString * md5Str=[NSString md5:currentTime];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    //create messageData
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //create movie
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempMovie/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempMovie/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempMovie/%@.mp4",md5Str]];
}
/*  .Document
 *    -messageData
 *      -tempIMMovie
 */
+ (NSString *)tempIMMovieSavePath{
    NSString * currentTime=[NSString stringWithFormat:@"movie%u",[ZTHUtils mGetTickCount]];
    NSString * md5Str=[NSString md5:currentTime];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    //create messageData
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //create movie
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempIMMovie/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempIMMovie/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/tempIMMovie/%@.mp4",md5Str]];
}


/*  .Document
 *    -messageData
 *      -movie
 */
+ (NSString *)movieSavePath{
    NSString * currentTime=[NSString stringWithFormat:@"movie%u",[ZTHUtils mGetTickCount]];
    NSString * md5Str=[NSString md5:currentTime];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    //create messageData
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //create movie
    if (![fileManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/movie/"]]]) {
        [fileManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/movie/"]] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/messageData/movie/%@.mp4",md5Str]];
}

+ (NSString *)movieSaveDictionary {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/messageData/movie/"];
}

+ (NSString *)imageSaveDictionary {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/messageData/img/"];
}

+ (NSString *)tempImageSaveDictionary {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/messageData/tempImg/"];
}

+ (NSString *)nowCorrectPath:(NSString *)path{
    NSMutableString * retStr=[NSMutableString stringWithString:NSHomeDirectory()];
    NSRange tmpRange=[path rangeOfString:@"Documents"];
    if (tmpRange.location==NSNotFound) {
        return path;
    }
    NSString * subPath=[path substringWithRange:NSMakeRange(tmpRange.location, path.length-tmpRange.location)];
    [retStr appendFormat:@"/%@",subPath];
    return retStr;
}
+ (BOOL)removeDocumentFileWithPath:(NSString *)path{
    path=[self nowCorrectPath:path];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    if ([fileManager fileExistsAtPath:path]) {
        BOOL resutl=[fileManager removeItemAtPath:path error:nil];
        return resutl;
    }
    return NO;
}
+ (NSString *)saveImageToDocumentWithPath:(NSString *)str image:(UIImage *)image{
    NSData *data;
    NSMutableString * savePath=[NSMutableString stringWithString:str];
    if (UIImagePNGRepresentation(image) == nil) {
        
        data = UIImageJPEGRepresentation(image, 1);
        [savePath appendString:@".jpg"];
        
    } else {
        
        data = UIImagePNGRepresentation(image);
        [savePath appendString:@".png"];
    }
    BOOL saveResult=[data writeToFile:savePath atomically:NO];
    if (saveResult) {
        return savePath;
    }
    
    return nil;
}
+ (UIImage *)imageWithDocumentPath:(NSString *)str{
    str=[self nowCorrectPath:str];
    NSFileManager * fileManager=[[NSFileManager alloc]init];
    if ([fileManager fileExistsAtPath:str]) {
        return [[UIImage alloc]initWithContentsOfFile:str];
    }else{
        return nil;
    }
}

@end
