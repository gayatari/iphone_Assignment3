//
//  dbAdapter.h
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbHelper.h"

@interface dbAdapter : dbHelper
{
    
    NSArray *valueArray;
    NSArray *keyArray;
    NSMutableDictionary *keyValueDictionary;
}
-(void)createFlickrRecord:(NSMutableArray *)flickrArray;
-(void)setEntity;
-(void)setEntityColumns;
//-(NSMutableArray *)fetchFlickrRecords;
-(NSArray *)fetchFlickrRecords;
-(void)deleteFlickrRecords;
@end
