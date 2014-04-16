//
//  CustomTableViewCell.h
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomTableViewCell : UITableViewCell
{
    
    
}

@property (nonatomic, strong) IBOutlet UIImageView* storeLogoImageView;
@property (nonatomic, strong) IBOutlet UILabel* phoneLabel;
@property (nonatomic, strong) IBOutlet UILabel* addressLabel;


@end
