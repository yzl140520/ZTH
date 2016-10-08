//
//  ZTHVersion
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTHVersion : NSObject

DEFINE_SINGLETON_FOR_HEADER( ZTHVersion )

@property (nonatomic, readonly) NSUInteger	major;
@property (nonatomic, readonly) NSUInteger	minor;
@property (nonatomic, readonly) NSUInteger	tiny;
@property (nonatomic, readonly) NSString *	pre;
@property (nonatomic, readonly) NSString *	ver;

@end
