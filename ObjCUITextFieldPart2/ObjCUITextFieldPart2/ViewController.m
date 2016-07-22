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
    
    NSString* resultString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"new string = %@", resultString);
    
    NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@" ,"];// if you want to create own separators
    NSCharacterSet* digitsOnly = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];//inverted set means - all not including decimalDigitCharacterSet
    
    NSArray* words = [resultString componentsSeparatedByCharactersInSet:set];
    NSLog(@"words = %@", words);
    
    return resultString.length <=10;
}

@end
