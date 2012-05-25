//
//  dbAdapter.m
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dbAdapter.h"
#import "FlickrModel.h"

@implementation dbAdapter

-(void)setEntity
{
    entityName=@"FlickrData";
}

-(void)setEntityColumns
{
    attributeNames=[[NSArray alloc]initWithObjects:@"id",@"title",@"secret",@"server",nil];
}

-(void)createFlickrRecord:(NSMutableArray *)flickrArray
{
    
  /*  keyValueDictionary=[[NSMutableDictionary alloc]init];
    for (int i=0; i<[flickrArray count]; i++) {
        FlickrModel *flickr=[[FlickrModel alloc]init];
        flickr=[flickrArray objectAtIndex:i];
        [keyValueDictionary setObject:flickr.flickrId forKey:@"id"];
        [keyValueDictionary setObject:flickr.flickrTitle forKey:@"title"];
      //  [keyValueDictionary setObject:flickr.flickrFarm forKey:@"farm"];
        [keyValueDictionary setObject:flickr.flickrSecret forKey:@"secret"];       
        [keyValueDictionary setObject:flickr.flickrServer forKey:@"server"];

        [super insert:keyValueDictionary];
    }*/
    [self setEntity];
    [self setEntityColumns];
    keyValueDictionary=[[NSMutableDictionary alloc]init];
    for (int i=0; i<[flickrArray count]; i++) {
        FlickrModel *flickr=[[FlickrModel alloc]init];
        flickr=[flickrArray objectAtIndex:i];

    valueArray=[[NSArray alloc]initWithObjects:flickr.flickrId,flickr.flickrTitle,flickr.flickrSecret,flickr.flickrServer ,nil];
    
   
    /////////
    keyArray =[[NSArray alloc]initWithObjects:[attributeNames objectAtIndex:0],[attributeNames objectAtIndex:1],[attributeNames objectAtIndex:2],[attributeNames objectAtIndex:3] ,nil];
        
    //keyArray =[[NSArray alloc]initWithObjects:@"id",@"title",@"secret",@"server",nil];
    /////////
        
    keyValueDictionary=[NSMutableDictionary dictionaryWithObjects:valueArray forKeys:keyArray];
    [super insertData:keyValueDictionary];
    
    NSLog(@"Dict..%@",keyValueDictionary);
    
    NSLog(@"Count %d",[keyValueDictionary count]);
    }
    
}

//-(NSMutableArray *)fetchFlickrRecords
-(NSArray *)fetchFlickrRecords
{
    [self setEntity];
    [self setEntityColumns];
    return [super fetchAll];
}

-(void)deleteFlickrRecords
{
    [self setEntity];
    [self setEntityColumns];
    
    [super deleteAll];
}

@end
