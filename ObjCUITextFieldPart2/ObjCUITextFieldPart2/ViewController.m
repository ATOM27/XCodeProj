//
//  ViewController.m
//  ObjCUITextFieldPart2
//
//  Created by Eugene Mekhedov on 22.07.16.
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

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"textField text = %@", textField.text);
    NSLog(@"shouldChangeCharactersInRange %@", NSStringFromRange(range));
    NSLog(@"replacementString = %@", string);
    
    return true;
}

@end
