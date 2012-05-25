//
//  DisplayImagesViewController.m
//  FlickrApplication
//
//  Created by nachi on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayImagesViewController.h"
#import "dbAdapter.h"
#import "FlickrModel.h"

@implementation DisplayImagesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    
      displayArray = [[NSMutableArray alloc]init];
    displayArray1 = [[NSArray alloc]init];
    newDisplayArray =[[NSMutableArray alloc]init];
    dbAdapter *adapter=[[dbAdapter alloc]init];
    displayArray1=[adapter fetchFlickrRecords];
    displayArray=(NSMutableArray *)displayArray1;
    
    

    NSLog(@"Display array count :- %@", [displayArray objectAtIndex:0]);
    
    
    
    for(int i=0;i<10;i++)
    {
        FlickrModel *newModel=[[FlickrModel alloc]init];
        FlickrModel *model = [displayArray objectAtIndex:i];
        newModel.flickrId=[model valueForKey:@"id"];
        newModel.flickrTitle=[model valueForKey:@"title"];
        newModel.flickrSecret=[model valueForKey:@"secret"];
        newModel.flickrServer=[model valueForKey:@"server"];
        [newDisplayArray addObject:newModel];
    } 
    
    
    
}

- (void)viewDidUnload
{
    [displayTableView release];
    displayTableView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [newDisplayArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [displayTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    FlickrModel *model = [newDisplayArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.flickrTitle;
    NSString *photoURLString = [NSString stringWithFormat:@"http://static.flickr.com/%@/%@_%@_s.jpg", model.flickrServer, model.flickrId, model.flickrSecret];
   
   // UIImageView *warrantyCardImage;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL  URLWithString:photoURLString]];
    if(imageData)
    {
       cell.imageView.image=[UIImage imageWithData:imageData];
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)dealloc {
    [displayTableView release];
    [super dealloc];
}
@end
