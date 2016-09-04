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

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    EMDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
    
        UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];
    
        [popover presentPopoverFromBarButtonItem:sender
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    }else{
        
        [self showControllerAsModal:vc];
    }
}

- (IBAction)actionPressMe:(UIButton *)sender {
    
    EMDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
        UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];
        
//        [popover presentPopoverFromBarButtonItem:sender
//                        permittedArrowDirections:UIPopoverArrowDirectionAny
//                                        animated:YES];
    }else{
        
        [self showControllerAsModal:vc];
    }
}
@end
