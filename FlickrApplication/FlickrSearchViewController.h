//
//  FlickrSearchViewController.h
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DisplayImagesViewController;

@interface FlickrSearchViewController : UIViewController<UITextFieldDelegate,ASIHTTPRequestDelegate>
{
    NSString *responseJSONString;
    NSString *photoURLString;
    NSString *strID;
    NSString *strFarm;
    NSString *strServer;
    NSString *strSecret;
    NSString *title;
    
    NSMutableArray  *photoTitles;         
    //NSMutableArray  *photoSmallImageData; 
    NSMutableArray  *photoURLsLargeImage;
    NSMutableArray *insertArray;
    
    DisplayImagesViewController *display;
    BOOL statusFlag;
}
@property (retain, nonatomic) IBOutlet UITextField *textSearch;
- (IBAction)buttonSearch:(id)sender;

@end
