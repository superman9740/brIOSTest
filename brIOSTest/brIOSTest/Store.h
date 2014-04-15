//
//  Store.h
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
{
    
    
}

@property (nonatomic, copy) NSString* address;
@property (nonatomic, copy) NSString* city;
@property (nonatomic, copy) NSString* state;

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* latitude;
@property (nonatomic, strong) NSString* zipcode;
@property (nonatomic, strong) NSString* storeLogoURL;
@property (nonatomic, strong) NSString* phone;
@property (nonatomic, strong) NSString* longitude;

@property (nonatomic, strong) NSString* storeID;






@end
