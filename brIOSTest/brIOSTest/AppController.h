//
//  AppController.h
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"
#import <RestKit.h>

static NSString* const kRefreshTableViewNotification  = @"refreshTableViewNotification";


@interface AppController : NSObject
{
    AFHTTPClient* client;
    RKObjectManager* objectManager;


}

@property (nonatomic, strong) NSMutableArray* stores;


+ (id)sharedInstance;


@end
