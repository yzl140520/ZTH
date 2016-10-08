//
//  ZTHUserDefaults.h
//  ZTH
//
//  Created by yzl on 16/6/7.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTHUserDefaults : NSObject
DEFINE_SINGLETON_FOR_HEADER(ZTHUserDefaults);

- (BOOL)hasObjectForKey:(id)key;

- (void)setObject:(id)value forKey:(NSString *)key;

- (void)removeObjectForKey:(NSString *)key;

- (void)removeAllObjects;

- (void)setObject:(id)obj forKeyedSubscript:(id)key;

- (id)objectForKeyedSubscript:(id)key;

- (id)objectForKey:(NSString *)key;

@end
