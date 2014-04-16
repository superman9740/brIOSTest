//
//  StoreDetailViewController.m
//  brIOSTest
//
//  Created by Shane Dickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import "StoreDetailViewController.h"
#import "AppController.h"

@implementation StoreDetailViewController

-(void)viewDidLoad
{
    
    Store* store = [[[AppController sharedInstance] stores] objectAtIndex:self.selectedIndex];
    
    
    self.phone.text = store.phone;
    self.city.text = store.city;
    self.address.text = store.address;
    self.state.text = store.state;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0);
    dispatch_async(queue, ^{
        NSData   *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:store.storeLogoURL]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            self.logoView.image = [UIImage imageWithData:data];
            
        });
        
    });
 
 
    
}
@end
