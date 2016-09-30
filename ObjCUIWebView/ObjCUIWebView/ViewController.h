//
//  ViewController.h
//  ObjCUIWebView
//
//  Created by Eugene Mekhedov on 26.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activitiIndicator;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;

- (IBAction)actionBack:(UIBarButtonItem *)sender;
- (IBAction)actionForwar:(UIBarButtonItem *)sender;
- (IBAction)actionRefresh:(UIBarButtonItem *)sender;

@end

