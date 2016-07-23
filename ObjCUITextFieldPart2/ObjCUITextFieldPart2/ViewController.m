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
    
//    NSLog(@"textField text = %@", textField.text);
//    NSLog(@"shouldChangeCharactersInRange %@", NSStringFromRange(range));
//    NSLog(@"replacementString = %@", string);
 
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSCharacterSet* digitsSetInverted = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* components = [string componentsSeparatedByCharactersInSet:digitsSetInverted];
    
    
    if ([components count] > 1){
        return FALSE;
    }
    NSLog(@"new string = %@", newString);
    
    NSMutableString* resultString = [[NSMutableString alloc] init];
    
    static const int localNumberMaxLenght = 7;
    static const int areaCodeMaxLenght = 3;
    static const int countryCodeMaxLenght = 3;
    
//    NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@" ,"];// if you want to create own separators
//    NSCharacterSet* digitsOnly = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];//inverted set means - all not including decimalDigitCharacterSet
//    
//    NSArray* words = [resultString componentsSeparatedByCharactersInSet:set];
//    NSLog(@"words = %@", words);
    
    return resultString.length <=10;
}

@end
