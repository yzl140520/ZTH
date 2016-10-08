//
//  ZTHVersion
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//


#import "ZTHVersion.h"

@implementation ZTHVersion
DEFINE_SINGLETON_FOR_CLASS( ZTHVersion )

@synthesize major = _major;
@synthesize minor = _minor;
@synthesize tiny = _tiny;
@synthesize pre = _pre;
@synthesize ver = _ver;

- (id)init
{
    self = [super init];
    if ( self )
    {
        _ver = [ZTHSystemInfo appShortVersion];
        
        NSArray * array = [_ver componentsSeparatedByString:@" "];
        if ( array.count > 0 )
        {
            if ( array.count > 1 )
            {
                _pre = [array objectAtIndex:1];
            }
            else
            {
                _pre = @"";
            }
            
            NSArray * subvers = [[array objectAtIndex:0] componentsSeparatedByString:@"."];
            if ( subvers.count >= 1 )
            {
                _major = [[subvers objectAtIndex:0] intValue];
            }
            if ( subvers.count >= 2 )
            {
                _minor = [[subvers objectAtIndex:1] intValue];
            }
            if ( subvers.count >= 3 )
            {
                _tiny = [[subvers objectAtIndex:2] intValue];
            }
        }
    }
    return self;
}

@end
