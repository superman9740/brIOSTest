//
//  AsyncImageView.m
//
//  Created by Shane Dickson on 2/27/13.
// 
//

#import "AsyncImageView.h"

@implementation AsyncImageView

- (id)init
{
    self = [super init];
    if (self) {
       
        
    }
    return self;
}

-(void)update
{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:_urlPath]];
    if(_receivedData != nil)
    {
        [_receivedData setLength:0];
        
    }
    else
    {
        _receivedData = [[NSMutableData alloc] init];
        
    }
   
    
    
    // Create Connection.
    _conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (_conn)
    {
 //       [[tbLogger sharedInstance] debug:[NSString stringWithFormat:@"Data will be received from URL: %@", request.URL]];
    }
    else
    {
   //     [[tbLogger sharedInstance] debug:[NSString stringWithFormat:@"Data could not be received from: %@", request.URL]] ;
        
    }
    
}
#pragma mark NSURLConnection delegate methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receivedData setLength:0];
}



-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to the receivedData.
    [_receivedData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  //  [[tbLogger sharedInstance] debug:[NSString stringWithFormat:@"Succeeded! Received %d bytes of data", [_receivedData length]]];
    
    UIImage* tempImage = [[UIImage alloc] initWithData:_receivedData];
    [self setImage:tempImage];
    if(self.callback)
    {
        self.callback();
        
    }

    [self setNeedsDisplay];
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  //  [[tbLogger sharedInstance] debug:[NSString stringWithFormat:@"From connectionDidFinishLoading: %@", error.localizedDescription]];
    
    
}

@end
