//
//  DisplayImagesViewController.h
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayImagesViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *displayTableView;
    NSArray *displayArray1;
    NSMutableArray *displayArray;
    NSMutableArray *newDisplayArray;
}

@end
