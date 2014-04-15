//
//  AppController.h
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"


static NSString* const kRefreshTableViewNotification  = @"refreshTableViewNotification";


@interface AppController : NSObject
{
    
    


}

@property (nonatomic, strong) NSMutableArray* stores;


+ (id)sharedInstance;


@end
