//
//  NSManagedObjectContext+QDAdditions.h
//  LMQD
//
//  Created by min zhang on 15/10/31.
//  Copyright © 2015年 Yimeng. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (QDAdditions)

- (void)saveToPersistentStore;

@end
