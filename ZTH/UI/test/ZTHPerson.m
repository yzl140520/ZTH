//
//  ZTHPerson.m
//  ZTH
//
//  Created by yzl on 16/8/8.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHPerson.h"
@interface ZTHPerson()

@end
@implementation ZTHPerson
- (void)addObject:(NSString*)object{
    [self willChangeValueForKey:@"persons"];
    [self.persons addObject:object];
    [self didChangeValueForKey:@"persons"];
}

#pragma mark - setter & getter
- (NSMutableArray*)persons{
    if (!_persons) {
        _persons = [[NSMutableArray alloc]init];
    }
    return _persons;
}
@end
