//
//  SDImageCache+QDCache.m
//  LMQD
//
//  Created by min zhang on 15/11/11.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "SDImageCache+QDCache.h"

#import <objc/runtime.h>

static const void *SDImageCacheCompleteBlockKey      = &SDImageCacheCompleteBlockKey;
static const void *SDImageCacheCleanCompleteBlockKey = &SDImageCacheCleanCompleteBlockKey;

@interface SDImageCache ()

@property (strong, nonatomic) NSCache *memCache;
@property (strong, nonatomic) NSString *diskCachePath;

@end

@implementation SDImageCache (QDCache)

- (void)qd_storeImageSync:(UIImage *)image imageData:(NSData *)imageData forKey:(NSString *)key
{
    if (!image || !key) {
        return;
    }
    
    // !!!:这里不能保存image，由于有可能这个image对应的文件被删除，导致取这个image失败，主要是在发布流程中，把发布的图片存进来，后面再把原图片删除，这时候如果在内存中保留这个image的实例会出现取不到图片的问题
    /*[self.memCache setObject:image forKey:key cost:image.size.height * image.size.width * image.scale];*/
    
    if (imageData) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:self.diskCachePath]) {
            [fileManager createDirectoryAtPath:self.diskCachePath withIntermediateDirectories:YES attributes:nil error:NULL];
        }
        
        [fileManager createFileAtPath:[self defaultCachePathForKey:key] contents:imageData attributes:nil];
    }
}

- (void)asyncCalculateSizeWithCompletionBlock:(SDWebImageCalculateSizeBlock)completionBlock;
{
    SDWebImageCalculateSizeBlock oldBlock = objc_getAssociatedObject(self, SDImageCacheCompleteBlockKey);
    objc_setAssociatedObject(self, SDImageCacheCompleteBlockKey, completionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (oldBlock) {
        return;
    }
    [self calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
        SDWebImageCalculateSizeBlock block = objc_getAssociatedObject(self, SDImageCacheCompleteBlockKey);
        objc_setAssociatedObject(self, SDImageCacheCompleteBlockKey, NULL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        block(fileCount, totalSize);
    }];
}

- (void)asyncClearDiskOnCompletion:(SDWebImageNoParamsBlock)completionBlock
{
    SDWebImageNoParamsBlock oldBlock = objc_getAssociatedObject(self, SDImageCacheCleanCompleteBlockKey);
    objc_setAssociatedObject(self, SDImageCacheCleanCompleteBlockKey, completionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (oldBlock) {
        return;
    }
    [self clearDiskOnCompletion:^{
        SDWebImageNoParamsBlock block = objc_getAssociatedObject(self, SDImageCacheCleanCompleteBlockKey);
        objc_setAssociatedObject(self, SDImageCacheCleanCompleteBlockKey, NULL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        block();
    }];
}

- (BOOL)imageCacheIsClearing;
{
    return objc_getAssociatedObject(self, SDImageCacheCleanCompleteBlockKey) ? YES : NO;
}

@end
