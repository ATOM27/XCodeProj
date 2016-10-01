//
//  EMWebViewController.h
//  ObjCUIWebViewDZ
//
//  Created by Eugene Mekhedov on 01.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString* cellString;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backBarItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardBarItem;

- (IBAction)actionGoBack:(UIBarButtonItem *)sender;
- (IBAction)actionGoForward:(UIBarButtonItem *)sender;
- (IBAction)actionRefresh:(UIBarButtonItem *)sender;

@end
