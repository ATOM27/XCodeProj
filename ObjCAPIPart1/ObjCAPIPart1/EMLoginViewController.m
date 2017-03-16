//
//  EMLoginViewController.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 08.01.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

#import "EMLoginViewController.h"
#import "EMAccessToken.h"

@interface EMLoginViewController ()

@property (copy, nonatomic) EMLoginCompletionBlock completionBlock; // blocks shoud have "copy" paramether
@property (weak, nonatomic) UIWebView* webView;

@end

@implementation EMLoginViewController

-(id) initWithCompletionBlock:(EMLoginCompletionBlock) completionBlock{
    self = [super init];
    if (self) {
        self.completionBlock = completionBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect r = self.view.bounds;
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:r];
    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:webView];
    webView.delegate = self;
    self.webView = webView;
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                          target:self
                                                                          action:@selector(actionCansel:)];
    
    [self.navigationItem setRightBarButtonItem:item];
    
    self.navigationItem.title = @"Login";
    
    NSString* urlString = @"https://oauth.vk.com/authorize?"
                           "client_id=5811974&"
                           "display=mobile&"
                           "redirect_uri=https://oauth.vk.com/blank.html&"
                           "scope=139286&"
                           "response_type=token&"
                           "v=5.62&revoke=1";
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    self.webView.delegate = nil;
}

#pragma mark - Actions

-(void) actionCansel:(UIBarButtonItem*) item{
    
    if (self.completionBlock){
        self.completionBlock(nil);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    EMAccessToken* accessToken = [[EMAccessToken alloc] init];
    
    if ([request.URL.path isEqualToString:@"/blank.html"]){
        
        NSString* description = request.URL.description;
        
        NSArray* array = [description componentsSeparatedByString:@"#"];
        
        NSString* paramsString = [array lastObject];
        
        NSArray* pairs = [paramsString componentsSeparatedByString:@"&"];
        
        for(NSString* pair in pairs){
            
            NSArray* values = [pair componentsSeparatedByString:@"="];
            
            if([[values firstObject] isEqualToString:@"access_token"]){
                accessToken.token = [values lastObject];
            }else if ([[values firstObject] isEqualToString:@"expires_in"]){
                NSTimeInterval interval = [[values lastObject] doubleValue];
                NSDate* expDate = [NSDate dateWithTimeIntervalSinceNow:interval];
                accessToken.expirationDate = expDate;
            }else if ([[values firstObject] isEqualToString:@"user_id"]){
                accessToken.userID = [values lastObject];
            }
        }
        
        if (self.completionBlock){
            self.completionBlock(accessToken);
        }
        
       [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    NSLog(@"%@", request.URL);
    return YES;
}

@end
