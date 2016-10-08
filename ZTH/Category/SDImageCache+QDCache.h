//
//  SDImageCache+QDCache.h
//  LMQD
//
//  Created by min zhang on 15/11/11.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <SDImageCache.h>

@interface SDImageCache (QDCache)

- (void)qd_storeImageSync:(UIImage *)image imageData:(NSData *)imageData forKey:(NSString *)key;

- (void)asyncCalculateSizeWithCompletionBlock:(SDWebImageCalculateSizeBlock)completionBlock;

- (void)asyncClearDiskOnCompletion:(SDWebImageNoParamsBlock)completionBlock;

- (BOOL)imageCacheIsClearing;

@end
