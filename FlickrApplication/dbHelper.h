//
//  dbHelper.h
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface dbHelper : NSObject
{
    NSString *entityName;
    NSArray *attributeNames;
    NSArray *displayArray;
    NSManagedObjectContext *context;
}
-(void)insertData:(NSDictionary *)dictionary;
//-(NSMutableArray *)fetchAll;
-(NSArray *)fetchAll;
-(void)deleteAll;
- (void)saveContext;
@end
