//
//  TableViewController.m
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"
#import "AppController.h"
#import "StoreDetailViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTableView) name:kRefreshTableViewNotification object:nil];
    UINib* customCellNib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
    
    
    
    [self.tableView registerNib:customCellNib forCellReuseIdentifier:@"customCell"];
    [self.tableView reloadData];
    
     self.title = @"TableView";
    
}


-(void)refreshTableView
{
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    long count = [[[AppController sharedInstance] stores] count];
    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell* customCell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    Store* store = [[[AppController sharedInstance] stores] objectAtIndex:indexPath.row];
    
    
    if(customCell)
    {
        
        customCell.phoneLabel.text = store.phone;
        customCell.addressLabel.text = [NSString stringWithFormat:@"%@ %@ %@", store.address, store.city, store.state];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0);
        dispatch_async(queue, ^{
            NSData   *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:store.storeLogoURL]];
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                customCell.storeLogoImageView.image = [UIImage imageWithData:data];
                [customCell setNeedsDisplay];
                
            });
        
        });
        
    }
    
    
    return customCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 123;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreDetailViewController* detailViewController = [[StoreDetailViewController alloc] initWithNibName:@"StoreDetailView" bundle:nil];
    
    detailViewController.selectedIndex = indexPath.row;
    [self.navigationController pushViewController:detailViewController animated:YES];

}


@end
