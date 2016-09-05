//
//  ViewController.m
//  ObjCUIPopoverController
//
//  Created by Eugene Mekhedov on 04.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(void) showControllerAsModal:(UIViewController*) vc{
   
    [self presentViewController:vc
                       animated:YES
                     completion:^{
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             [self dismissViewControllerAnimated:YES completion:nil]; // dismiss is to close modal controller. We don't send "vc" to dissmis because on our controller can be obly one modal controller and "self" knows what controller it should close
                         });
                     }]; //presentViewController is like modal Action Segue
}

-(void) showController:(UIViewController*) vc inPopoverFromSender:(id) sender{
    
    //vc.modalPresentationStyle = UIModalPresentationPopover;
    //vc.preferredContentSize = CGSizeMake(300, 300);
    //[self presentViewController:vc animated:YES completion:nil];
    
    UINavigationController* navContr = [[UINavigationController alloc] initWithRootViewController:vc];
    navContr.modalPresentationStyle = UIModalPresentationPopover;
    
    navContr.preferredContentSize = CGSizeMake(300, 300);
    
    [self presentViewController:navContr animated:YES completion:nil];
    
    UIPopoverPresentationController* popover = [navContr popoverPresentationController]; //[vc popoverPresentationController];
    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    
    if ([sender isKindOfClass:[UIBarButtonItem class]]){
        
        popover.barButtonItem = sender;
    }else if ([sender isKindOfClass:[UIButton class]]){
        
        popover.sourceView = self.view;
        
        popover.sourceRect = CGRectMake(CGRectGetMidX([(UIButton*)sender frame]), CGRectGetMinY([(UIButton*)sender frame]), 0, 0);// so if you want to set x and y of your popover you need to make "sourceRect" with 0 size, but in "vc.preferredContentSize" need to make prefered size of your popover;
        //UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc dismissViewControllerAnimated:YES completion:nil];
        });
    }
}

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    EMDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
    
        //UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc]; // deprecated
        
        [self showController:vc inPopoverFromSender:sender];
        //[popover presentPopoverFromBarButtonItem:sender
          //              permittedArrowDirections:UIPopoverArrowDirectionAny
            //                            animated:YES]; // deprecated
    }else{
        
        [self showControllerAsModal:vc];
    }
}

- (IBAction)actionPressMe:(UIButton *)sender {
    
    EMDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
        [self showController:vc inPopoverFromSender:sender];
        
    }else{
        
        [self showControllerAsModal:vc];
    }
}
@end
