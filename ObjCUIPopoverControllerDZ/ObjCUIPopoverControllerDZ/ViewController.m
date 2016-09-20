//
//  ViewController.m
//  ObjCUIPopoverControllerDZ
//
//  Created by Eugene Mekhedov on 20.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMDatePickerViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton* but = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    UIBarButtonItem* infoItem = [[UIBarButtonItem alloc] initWithCustomView:but];
    self.navigationItem.rightBarButtonItem = infoItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setDate:(NSString *)date{
    _date = date;
    UITextView* textField = [self.textFieldCollection objectAtIndex:UITextFieldNameBirthDate];
    textField.text = date;
}

#pragma mark - Actions

-(void) showControllerAsModal:(EMDatePickerViewController*) vc{
    vc.delegate = self;
    [self presentViewController:vc
                       animated:YES
                     completion:^{
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             [self dismissViewControllerAnimated:YES completion:nil]; // dismiss is to close modal controller. We don't send "vc" to dissmis because on our controller can be obly one modal controller and "self" knows what controller it should close
                         });
                     }]; //presentViewController is like modal Action Segue

}

-(void) showController:(EMDatePickerViewController*) vc inPopoverFromSender:(UITextField*) sender{
    vc.delegate = self;
    UINavigationController* navContr = [[UINavigationController alloc] initWithRootViewController:vc];
    navContr.modalPresentationStyle = UIModalPresentationPopover;
    
    navContr.preferredContentSize = CGSizeMake(300, 300);
    
    [self presentViewController:navContr animated:YES completion:nil];
    
    UIPopoverPresentationController* popover = [navContr popoverPresentationController]; //[vc popoverPresentationController];
        popover.delegate = self;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        popover.sourceView = self.view;

        popover.sourceRect = sender.frame; // so if you want to set x and y of your popover you need to make "sourceRect" with 0 size, but in "vc.preferredContentSize" need to make prefered size of your popover;
        //UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];

}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.tag < UITextFieldNameEducation){
        [[self.textFieldCollection objectAtIndex:textField.tag+1] becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.tag == UITextFieldNameBirthDate){
        EMDatePickerViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDatePickerViewController"];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            
            [self showController:vc inPopoverFromSender:textField];
        }else{
            
            [self showControllerAsModal:vc];
        }
        
        return NO;
    }else{
        return YES;
    }
}

@end
