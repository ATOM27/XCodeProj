//
//  ViewController.m
//  ObjCUITextFieldPart1
//
//  Created by Eugene Mekhedov on 20.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)actionTextChanged:(UITextField *)sender {
    NSLog(@"%@", sender.text);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:self.firstNameField]){
        [self.secondNameField becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
    }
    
    return true;
}

@end
