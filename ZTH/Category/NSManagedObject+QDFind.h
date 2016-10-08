//
//  NSManagedObject+QDFind.h
//  LMQD
//
//  Created by min zhang on 15/10/20.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (QDFind)

+ (void)qd_handleErrors:(NSError *)error;

+ (id)qd_findFirstWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;
+ (id)qd_findFirstByAttribute:(NSString *)attribute withValue:(id)searchValue inContext:(NSManagedObjectContext *)context;

+ (NSArray *)qd_findAllWithEntityName:(NSString *)name predicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;
+ (NSArray *)qd_findAllWithPredicate:(NSPredicate *)searchTerm inContext:(NSManagedObjectContext *)context;
+ (NSArray *)qd_findAllOrderBy:(NSString *)orderItem ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;
+ (NSArray *)qd_findByAttribute:(NSString *)attribute withValue:(id)searchValue inContext:(NSManagedObjectContext *)context;
+ (NSArray *)qd_findByAttribute:(NSString *)attribute withValue:(id)searchValue andOrderBy:(NSString *)sortTerm ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;
+ (NSArray *)qd_findAllWithPredicate:(NSPredicate *)searchTerm
               withSortDescriptor:(NSSortDescriptor *)sortDescriptor
                        inContext:(NSManagedObjectContext *)context;
+ (NSArray *)qd_findAllWithPredicate:(NSPredicate *)searchTerm
          withSortDescriptorArray:(NSArray *)sortDescriptorArray
                        inContext:(NSManagedObjectContext *)context;

@end
