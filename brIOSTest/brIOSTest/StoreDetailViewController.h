//
//  StoreDetailViewController.h
//  brIOSTest
//
//  Created by Shane Dickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreDetailViewController : UIViewController
{
    
    
}

@property (nonatomic, strong) IBOutlet UILabel* address;
@property (nonatomic, strong) IBOutlet UILabel* city;
@property (nonatomic, strong) IBOutlet UILabel* state;
@property (nonatomic, strong) IBOutlet UILabel* phone;
@property (nonatomic, strong) IBOutlet UIImageView* logoView;
@property (nonatomic, assign) int selectedIndex;





@end
