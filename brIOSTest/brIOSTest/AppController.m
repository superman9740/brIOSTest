//
//  AppController.m
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import "AppController.h"
#import <RestKit.h>

static AppController *sharedInstance = nil;

@implementation AppController



+ (AppController *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}


- (id)init
{
    self = [super init];
    
    if (self) {
        
      
        NSURL *baseURL = [NSURL URLWithString:@"http://strong-earth-32.heroku.com"];
        AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
        
        // initialize RestKit
        RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
        
        // setup object mappings
        RKObjectMapping *venueMapping = [RKObjectMapping mappingForClass:[Store class]];
        [venueMapping addAttributeMappingsFromArray:@[@"address",@"city", @"name", @"latitude", @"zipcode", @"storeLogoURL", @"phone", @"longitude", @"storeID", @"state"]];
        
        // register mappings with the provider using a response descriptor
        RKResponseDescriptor *responseDescriptor =
        [RKResponseDescriptor responseDescriptorWithMapping:venueMapping
                                                     method:RKRequestMethodGET
                                                pathPattern:@"/stores.aspx"
                                                    keyPath:@"stores"
                                                statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        [objectManager addResponseDescriptor:responseDescriptor];
        
    }
    
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/stores.aspx"
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  self.stores = [[NSMutableArray alloc] initWithArray:mappingResult.array];
                                                  
                                                  
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                      [[NSNotificationCenter defaultCenter] postNotificationName:kRefreshTableViewNotification object:nil userInfo:nil];
                                                      
                                                  });
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"There was an error in fetching the data: %@", error);
                                              }];
    
    return self;
}

-(void)dealloc
{
    
    [self.stores release];
    
    [super dealloc];
    
    
}
@end
