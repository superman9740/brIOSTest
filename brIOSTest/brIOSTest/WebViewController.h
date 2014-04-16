//
//  WebViewController.h
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
{
    
    
}

@property (nonatomic, strong) IBOutlet UIWebView* webView;
@property (nonatomic, strong)  UIBarButtonItem* rewind;
@property (nonatomic, strong)  UIBarButtonItem* forward;
@property (nonatomic, strong)  UIBarButtonItem* stop;
@property (nonatomic, strong)  UIBarButtonItem* reload;


-(IBAction)rewind:(id)sender;
-(IBAction)forward:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)refresh:(id)sender;

-(void)updateToolbarButtons;

@end
