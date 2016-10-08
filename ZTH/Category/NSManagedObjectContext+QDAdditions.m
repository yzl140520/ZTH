//
//  NSManagedObjectContext+QDAdditions.m
//  LMQD
//
//  Created by min zhang on 15/10/31.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSManagedObjectContext+QDAdditions.h"

@implementation NSManagedObjectContext (QDAdditions)

- (void)saveToPersistentStore
{
    void(^saveBlock)() = ^{
        NSError *localError = nil;
        BOOL obtained = [self obtainPermanentIDsForObjects:[[self insertedObjects] allObjects] error:&localError];
        if (!obtained) {
            if (localError) {
                NSAssert(!localError, @"保存数据库出错");
            }
            return;
        }
        BOOL success = [self save:&localError];
        if (! success && localError == nil) QDLogWarn(@"Saving of managed object context failed, but a `nil` value for the `error` argument was returned. This typically indicates an invalid implementation of a key-value validation method exists within your model. This violation of the API contract may result in the save operation being mis-interpretted by callers that rely on the availability of the error.");
        if (! success) {
            if (localError) {
                NSAssert(!localError, @"保存数据库出错");
            }
            return;
        }
        if (self.parentContext) {
            [self.parentContext saveToPersistentStore];
        }
    };
    if (self.parentContext == nil) {
        [self performBlock:saveBlock];
    }
    else {
        [self performBlockAndWait:saveBlock];
    }
}

@end
