//
//  ZTHPerson.h
//  ZTH
//
//  Created by yzl on 16/8/8.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTHPerson : NSObject
/*
 * name
 */
@property (strong,nonatomic) NSMutableArray* persons;

- (void)addObject:(NSString*)object;
@end
