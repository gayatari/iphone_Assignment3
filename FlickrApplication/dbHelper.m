//
//  dbHelper.m
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dbHelper.h"
#import "ViewControllerAppDelegate.h"
#import "FlickrModel.h"

@implementation dbHelper

-(void)insertData:(NSDictionary *)dictionary
{
    ViewControllerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    context = [appDelegate managedObjectContext];
    
    NSLog(@"Entity %@", entityName);    
    NSManagedObject *flickrManagedObj = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];

    
    for (id key in dictionary) {
        [flickrManagedObj setValue:[dictionary objectForKey:key] forKey:key];
        NSLog(@"$$$$ %@",key);
    }    
    NSError *error;
    [context save:&error];
    [self saveContext];
}
- (void)saveContext

{
    
    NSError *error = nil;
    
    
    
    if (context != nil)
        
    {             NSLog(@"context Found");

        if ([context hasChanges] && ![context save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            
            abort();
            
        }
        
    }
    
} 
-(void)deleteAll
{
    ViewControllerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRecordsObj = [[NSFetchRequest alloc] init];
    [fetchRecordsObj setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
    NSArray *FlickrArray = [context executeFetchRequest:fetchRecordsObj error:nil];
    [fetchRecordsObj release];
    for (NSManagedObject *obj in FlickrArray)
    {
        [context deleteObject:obj];
    }
    NSError *error = nil;
    [context save:&error];
}

//-(NSMutableArray *)fetchAll
-(NSArray *)fetchAll
{
    ViewControllerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    context = [appDelegate managedObjectContext];
    NSLog(@"entityName :- \n %@", entityName);
    NSLog(@"context :- \n %@", context);
  //  NSLog(@"Entities :- \n %@", [context]);
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName
                                                  inManagedObjectContext:context]; 
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDesc];
    
    NSError *error;
   displayArray = [context executeFetchRequest:request error:&error];
    if([displayArray count] == 0)
        NSLog(@"Display array is NULL");
        
    [request release];
    return displayArray; 
    
   /* 
    [self saveContext];
    displayArray=[[NSArray alloc]init];

    ViewControllerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    context = [appDelegate managedObjectContext];

 
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];  
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext:context]; 

    [request setEntity:entityDesc];  


    NSError *error;  
    displayArray = [context executeFetchRequest:request error:&error];   
  //  NSLog(@"Count: %@",[displayArray count]);
    
    for(int i=0;i<[displayArray count];i++)
    {
        FlickrModel *model = [displayArray objectAtIndex:i];
        //NSString *flickrid = model.flickrTitle;
       // NSLog(@"MyTitle Helper: %@",flickrid);
    }
    return displayArray; 
    */
    
}
@end
