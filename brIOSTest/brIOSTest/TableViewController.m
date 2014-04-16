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
    }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSInteger count = [[[AppController sharedInstance] stores] count];
    
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
            //Async loading of store logo image
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



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreDetailViewController* detailViewController = [[StoreDetailViewController alloc] initWithNibName:@"StoreDetailView" bundle:nil];
    
    detailViewController.selectedIndex = indexPath.row;
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
}


@end
