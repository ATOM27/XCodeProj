//
//  ViewController.m
//  ObjCUIWebView
//
//  Created by Eugene Mekhedov on 26.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
/*    NSString* urlString = @"https://vk.com/id76240030";
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:urlRequest];
*/
    //NSString* filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];// main Bundle is the point to our app. Path for resource is what resourses we are locking for in our app folder
    // We can use smth like this: pathForResource:@"1.pdf" ofType:nil
    
/*    NSData* fileData = [NSData dataWithContentsOfFile:filePath];
    
    [self.webView loadData:fileData
                  MIMEType:@"application/pdf"
          textEncodingName:@"UTF-8"
                   baseURL:nil];// MIMEType is in manuals. U can google it.
*/
    
/*  NSURL* fileURL = [NSURL fileURLWithPath:filePath]; // for files its better to use fileURLWithPath;
    
    NSURLRequest* fileRequest = [NSURLRequest requestWithURL:fileURL];
    [self.webView loadRequest:fileRequest];
 */
    
    NSString* htmlString = @"<p><h1>Hello world!</h1>"
                            "<a href=\"flyflyfly\">BITCH</a>"
                            "</p>";
    
    [self.webView loadHTMLString:htmlString baseURL:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    UIApplication* app = [UIApplication sharedApplication];// indicator in UIBar near wifi
    app.networkActivityIndicatorVisible = YES;
    
    
    NSLog(@"shouldStartLoadWithRequest = %@", [request debugDescription]);
    
    if ([[request.URL absoluteString] rangeOfString:@"fly"].location != NSNotFound){
        return NO;
    }
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"webViewDidStartLoad");
    UIApplication* app = [UIApplication sharedApplication];// indicator in UIBar near wifi
    app.networkActivityIndicatorVisible = YES;
    
    [self.activitiIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad");
    UIApplication* app = [UIApplication sharedApplication];// indicator in UIBar near wifi
    app.networkActivityIndicatorVisible = NO;
    
    [self.activitiIndicator stopAnimating];
    
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError, %@", [error localizedDescription]);

}


#pragma mark - Actions

- (IBAction)actionForwar:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoForward]){
        
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction)actionRefresh:(UIBarButtonItem *)sender {
    
    [self.webView stopLoading];
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];

    [self.webView reload];
}
- (IBAction)actionBack:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoBack]){
        
        [self.webView stopLoading];
        [self.webView goBack];
    }
}
@end
