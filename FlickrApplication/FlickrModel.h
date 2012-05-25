//
//  FlickrModel.h
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrModel : NSObject
{
    NSString *flickrId;
    NSString *flickrTitle;
    NSString *flickrSecret;
    NSString *flickrServer;
}
@property(nonatomic,retain)NSString *flickrId;
@property(nonatomic,retain)NSString *flickrTitle;
@property(nonatomic,retain)NSString *flickrSecret;
@property(nonatomic,retain)NSString *flickrServer;
-(NSString *)toString;
@end
