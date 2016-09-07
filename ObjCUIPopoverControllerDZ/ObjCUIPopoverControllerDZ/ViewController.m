//
//  ViewController.m
//  ObjCUIPopoverControllerDZ
//
//  Created by Eugene Mekhedov on 07.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton* buttonForStile = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [buttonForStile addTarget:self action:@selector(actionGiveInfo:) forControlEvents:UIControlEventTouchUpInside];
    self.rightItem = [[UIBarButtonItem alloc] initWithCustomView:buttonForStile];
    
    self.navigationItem.rightBarButtonItem = self.rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private methods

-(void) showViewController:(UIViewController*) vc inPopoverFromSender:(id) sender{
    
    vc.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:vc animated:YES completion:nil];
    
    UIPopoverPresentationController* popover = [vc popoverPresentationController];
    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popover.barButtonItem = self.rightItem;
    
}

#pragma mark - Actions

-(void) actionGiveInfo:(UIBarButtonItem*) sender{
    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"UIViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        [self showViewController:vc inPopoverFromSender:sender];
    }
}

@end
