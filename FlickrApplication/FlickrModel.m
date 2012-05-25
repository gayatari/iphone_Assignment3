//
//  FlickrModel.m
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlickrModel.h"

@implementation FlickrModel
@synthesize flickrId,flickrTitle,flickrSecret,flickrServer;

-(NSString *)toString
{
    return [NSString stringWithFormat:@"ID: %@ \nTITLE: %@ ",flickrId,flickrTitle];
    
}

-(void)dealloc
{
    [super dealloc];
    [flickrId release];
    [flickrTitle release];
    [flickrSecret release];
    [flickrServer release];
}

@end
