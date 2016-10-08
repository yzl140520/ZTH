//
//  NSManagedObject+QDFind.m
//  LMQD
//
//  Created by min zhang on 15/10/20.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import "NSManagedObject+QDFind.h"

static NSUInteger const kActiveRecordDefaultBatchSize = 10;
static NSNumber *defaultBatchSize = nil;

@implementation NSManagedObject (QDFind)

+ (void)qd_handleErrors:(NSError *)error
{
    // TODO:错误处理
    if (error)
    {
        NSDictionary *userInfo = [error userInfo];
        for (NSArray *detailedError in [userInfo allValues])
        {
            if ([detailedError isKindOfClass:[NSArray class]])
            {
                for (NSError *e in detailedError)
                {
                    if ([e respondsToSelector:@selector(userInfo)])
                    {
                        QDLogError(@"Error Details: %@", [e userInfo]);
                    }
                    else
                    {
                        QDLogError(@"Error Details: %@", e);
                    }
                }
            }
            else
            {
                QDLogError(@"Error: %@", detailedError);
            }
        }
        QDLogError(@"Error Domain: %@", [error domain]);
        QDLogError(@"Recovery Suggestion: %@", [error localizedRecoverySuggestion]);
    }
}

+ (void)setDefaultBatchSize:(NSUInteger)newBatchSize
{
    @synchronized(defaultBatchSize)
    {
        defaultBatchSize = [NSNumber numberWithUnsignedInteger:newBatchSize];
    }
}

+ (NSInteger)defaultBatchSize
{
    if (defaultBatchSize == nil)
    {
        [self setDefaultBatchSize:kActiveRecordDefaultBatchSize];
    }
    return [defaultBatchSize integerValue];
}

+ (NSArray *)executeFetchRequest:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;

    NSArray *results = [context executeFetchRequest:request error:&error];
    [self qd_handleErrors:error];
    return results;
}

+ (id)executeFetchRequestAndReturnFirstObject:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context
{
    [request setFetchLimit:1];

    NSArray *results = [self executeFetchRequest:request inContext:context];
    if ([results count] == 0)
    {
        return nil;
    }
    return [results objectAtIndex:0];
}


+ (NSEntityDescription *)entityDescriptionInContext:(NSManagedObjectContext *)context
{
    NSString *entityName = NSStringFromClass([self class]);
    return [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
}

+ (NSFetchRequest *)createFetchRequestInContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[self entityDescriptionInContext:context]];

    return request;
}

+ (NSFetchRequest *)requestFirstWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self createFetchRequestInContext:context];
    [request setPredicate:searchTerm];
    [request setFetchLimit:1];

    return request;
}

+ (NSFetchRequest *)requestFirstByAttribute:(NSString *)attribute withValue:(id)searchValue inContext:(NSManagedObjectContext *)context;
{
    NSFetchRequest *request = [self createFetchRequestInContext:context];
    [request setPredicate:[NSPredicate predicateWithFormat:@"%K = %@", attribute, searchValue]];

    return request;
}

+ (NSFetchRequest *)requestAllInContext:(NSManagedObjectContext *)context
{
    return [self createFetchRequestInContext:context];
}

+ (NSFetchRequest *)requestAllSortedBy:(NSString *)sortTerm ascending:(BOOL)ascending withPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self requestAllInContext:context];
    [request setPredicate:searchTerm];
    [request setIncludesSubentities:NO];
    [request setFetchBatchSize:[self defaultBatchSize]];

    if (sortTerm != nil) {
        NSSortDescriptor *sortBy = [[NSSortDescriptor alloc] initWithKey:sortTerm ascending:ascending];
        [request setSortDescriptors:[NSArray arrayWithObject:sortBy]];
    }

    return request;
}

+ (id)qd_findFirstWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self requestFirstWithPredicate:searchTerm inContext:context];

    return [self executeFetchRequestAndReturnFirstObject:request inContext:context];
}

+ (id)qd_findFirstByAttribute:(NSString *)attribute withValue:(id)searchValue inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self requestFirstByAttribute:attribute withValue:searchValue inContext:context];

    return [self executeFetchRequestAndReturnFirstObject:request inContext:context];
}

+ (NSArray *)qd_findAllWithEntityName:(NSString *)name predicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:name inManagedObjectContext:context]];
    if (searchTerm) {
        [request setPredicate:searchTerm];
    }

    return [self executeFetchRequest:request
                           inContext:context];
}

+ (NSArray *)qd_findAllWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self createFetchRequestInContext:context];
    if (searchTerm) {
        [request setPredicate:searchTerm];
    }

    return [self executeFetchRequest:request
                           inContext:context];
}

+ (NSArray *)qd_findAllOrderBy:(NSString *)orderItem ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self requestAllInContext:context];
    [request setIncludesSubentities:NO];
    [request setFetchBatchSize:[self defaultBatchSize]];
    NSSortDescriptor *sortBy = [[NSSortDescriptor alloc] initWithKey:orderItem ascending:ascending];
    [request setSortDescriptors:[NSArray arrayWithObject:sortBy]];
    
    return [self executeFetchRequest:request inContext:context];
}

+ (NSArray *)qd_findByAttribute:(NSString *)attribute withValue:(id)searchValue andOrderBy:(NSString *)sortTerm ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context
{
    NSPredicate *searchTerm = [NSPredicate predicateWithFormat:@"%K = %@", attribute, searchValue];
    NSFetchRequest *request = [self requestAllSortedBy:sortTerm ascending:ascending withPredicate:searchTerm inContext:context];

    return [self executeFetchRequest:request inContext:context];
}

+ (NSArray *)qd_findByAttribute:(NSString *)attribute withValue:(id)searchValue inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [self createFetchRequestInContext:context];

    [request setPredicate:[NSPredicate predicateWithFormat:@"%K = %@", attribute, searchValue]];

    return [self executeFetchRequest:request inContext:context];
}

+ (NSArray *)qd_findAllWithPredicate:(NSPredicate *)searchTerm
               withSortDescriptor:(NSSortDescriptor *)sortDescriptor
                        inContext:(NSManagedObjectContext *)context;
{
    NSFetchRequest *request = [self createFetchRequestInContext:context];
    if (searchTerm) {
        [request setPredicate:searchTerm];
    }
    if (sortDescriptor) {
        [request setSortDescriptors:@[sortDescriptor]];
    }
    
    return [self executeFetchRequest:request
                           inContext:context];
}

+ (NSArray *)qd_findAllWithPredicate:(NSPredicate *)searchTerm
          withSortDescriptorArray:(NSArray *)sortDescriptorArray
                        inContext:(NSManagedObjectContext *)context;
{
    NSFetchRequest *request = [self createFetchRequestInContext:context];
    if (searchTerm) {
        [request setPredicate:searchTerm];
    }
    if (sortDescriptorArray.count) {
        [request setSortDescriptors:sortDescriptorArray];
    }
    
    return [self executeFetchRequest:request
                           inContext:context];
}

@end
