//
//  tbAsyncImageView.h
//  tbAppStore
//
//  Created by Shane Dickson on 2/27/13.
//  
//

#import <UIKit/UIKit.h>


typedef void(^ImageDownloadCallback)();

@interface tbAsyncImageView : UIImageView
{
    

   

    
}
@property (nonatomic, strong) NSString* urlPath;

@property (nonatomic, strong) NSURLConnection* conn;
@property (nonatomic, strong) NSMutableData* receivedData;
@property (nonatomic, strong) ImageDownloadCallback callback;


-(void)update;


@end

