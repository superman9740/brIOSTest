//
//  WebViewController.m
//  brIOSTest
//
//  Created by sdickson on 4/15/14.
//  Copyright (c) 2014 sdickson. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *flexiableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    self.rewind = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(rewind:)];
    self.forward = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(forward:)];
    self.stop = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stop:)];
    self.reload = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    
    NSArray *items = [NSArray arrayWithObjects:self.rewind, self.forward,flexiableItem,self.stop,self.reload, nil];
    self.toolbarItems = items;
    
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    
    
    [flexiableItem release];


    self.title = @"WebView";
    
       
}


-(void)updateToolbarButtons
{
    self.rewind.enabled = self.webView.canGoBack;
    self.forward.enabled = self.webView.canGoForward;
    self.stop.enabled = self.webView.loading;
    
    
    
}

#pragma  web view delegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self updateToolbarButtons];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateToolbarButtons];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateToolbarButtons];
}



-(IBAction)rewind:(id)sender
{
    [self.webView goBack];
    
    
}
-(IBAction)forward:(id)sender
{
    [self.webView goForward];
    
    
}
-(IBAction)stop:(id)sender
{
    [self.webView stopLoading];
    
}
-(IBAction)refresh:(id)sender
{
    [self.webView reload];
    
    
}
-(void)dealloc
{
    
    [self.rewind release];
    [self.forward release];
    [self.stop release];
    [self.reload release];
    
    [super dealloc];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
