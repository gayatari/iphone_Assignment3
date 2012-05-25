//
//  FlickrSearchViewController.m
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlickrSearchViewController.h"
#import "SBJson.h"
#import "FlickrModel.h"
#import "dbAdapter.h"
#import "DisplayImagesViewController.h"

@implementation FlickrSearchViewController
@synthesize textSearch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    photoTitles = [[NSMutableArray alloc] init];
  //  photoSmallImageData = [[NSMutableArray alloc] init];
    photoURLsLargeImage = [[NSMutableArray alloc] init];
    insertArray=[[NSMutableArray alloc]init];
    statusFlag = false;
}

- (void)viewDidUnload
{
    [self setTextSearch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textSearch resignFirstResponder];
    return YES;
}

- (void)dealloc {
    [textSearch release];
    [super dealloc];
}

- (IBAction)buttonSearch:(id)sender 
{
    NSString *const FlickrAPIKey =@"9ec13aebecb5c50c87bd1a4a702ac0da";
    NSString *urlString = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=15&format=json&nojsoncallback=1", FlickrAPIKey, textSearch.text];
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
   
   
   /* else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error !!" message:@"Web Request Failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }*/
    

}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    responseJSONString = [request responseString];
    //  NSLog(@"JSON Response: - %@",responseJSONString);
    
    NSDictionary *results = [responseJSONString JSONValue];
    
    
    NSArray *photos = [[results objectForKey:@"photos"] objectForKey:@"photo"];
    
    for (NSDictionary *photo in photos)
    {
        FlickrModel *flickr=[[FlickrModel alloc]init];
        flickr.flickrTitle = [photo objectForKey:@"title"];
        [photoTitles addObject:(title.length > 0 ? title : @"Untitled")];
        
        
        flickr.flickrId = [photo objectForKey:@"id"];
     //   flickr.flickrFarm = [photo objectForKey:@"farm"];
        flickr.flickrServer = [photo objectForKey:@"server"];
        flickr.flickrSecret = [photo objectForKey:@"secret"] ;
        

        photoURLString = [NSString stringWithFormat:@"http://static.flickr.com/%@/%@_%@_s.jpg", flickr.flickrServer, flickr.flickrId, flickr.flickrSecret];
        [photoURLsLargeImage addObject:[NSURL URLWithString:photoURLString]];   // large images     
        
        [insertArray addObject:flickr];
        NSLog(@"URL for Large Image: %@\n", photoURLString); 
        [flickr release];
    } 
    dbAdapter *adapter=[[dbAdapter alloc]init];
    [adapter deleteFlickrRecords];
    [adapter createFlickrRecord:insertArray];

    //statusFlag = true;
    
    
    display=[[DisplayImagesViewController alloc]initWithNibName:@"DisplayImagesViewController" bundle:nil];
    [self presentModalViewController:display animated:YES];
    [display release];
   
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"Error in WebCall: %@",&error);
    statusFlag = false;
}
@end
