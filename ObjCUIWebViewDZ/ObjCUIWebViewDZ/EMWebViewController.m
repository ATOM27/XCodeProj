//
//  EMWebViewController.m
//  ObjCUIWebViewDZ
//
//  Created by Eugene Mekhedov on 01.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMWebViewController.h"

@interface EMWebViewController ()

@property (assign, nonatomic) CGFloat testScale;

@end

@implementation EMWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPinchGestureRecognizer* pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.webView addGestureRecognizer:pinchGestureRecognizer];
    
    NSURLRequest* urlRequest = nil;
    
    if ([self.cellString rangeOfString:@"pdf"].location != NSNotFound){
        self.toolBar.hidden = YES;
        NSString* filePath = [[NSBundle mainBundle] pathForResource:self.cellString ofType:nil];
        NSURL* fileURL = [NSURL fileURLWithPath:filePath];
         urlRequest = [NSURLRequest requestWithURL:fileURL];
        
    }else{
        
        NSURL* url = [NSURL URLWithString:self.cellString];
        urlRequest = [NSURLRequest requestWithURL:url];
    }
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void) activityIndicatorIsVisible:(BOOL) visability{
    UIApplication* app = [UIApplication sharedApplication];// indicator in UIBar near wifi
    app.networkActivityIndicatorVisible = visability;

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    [self activityIndicatorIsVisible:YES];
    self.backBarItem.enabled = [self.webView canGoBack];
    self.forwardBarItem.enabled = [self.webView canGoForward];
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
    [self activityIndicatorIsVisible:YES];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self activityIndicatorIsVisible:NO];
    self.backBarItem.enabled = [self.webView canGoBack];
    self.forwardBarItem.enabled = [self.webView canGoForward];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Gestures

-(void)handlePinch:(UIPinchGestureRecognizer*) pinchGesture{
    NSLog(@"%f", pinchGesture.scale);
    if (pinchGesture.state == UIGestureRecognizerStateBegan){
        self.testScale = 1.f;
    }
    CGFloat newScale = 1.f + pinchGesture.scale - self.testScale;
    self.webView.transform = CGAffineTransformScale(self.webView.transform, newScale, newScale);
    self.testScale = pinchGesture.scale;
}

#pragma mark - Actions

- (IBAction)actionGoBack:(UIBarButtonItem *)sender {
    if ([self.webView canGoBack]){
        
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction)actionGoForward:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoForward]){
        
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction)actionRefresh:(UIBarButtonItem *)sender {
    
    [self.webView stopLoading];
    [self.webView reload];
}

@end
