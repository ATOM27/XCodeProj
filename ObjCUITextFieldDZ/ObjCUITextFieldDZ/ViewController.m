//
//  ViewController.m
//  ObjCUITextFieldDZ
//
//  Created by Eugene Mekhedov on 27.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM (NSInteger, EMTextFieldType){
    EMTextFieldTypeName,
    EMTextFieldTypeSurname,
    EMTextFieldTypeLogin,
    EMTextFieldTypePassword,
    EMTextFieldTypeAge,
    EMTextFieldTypePhone,
    EMTextFieldTypeEmail
};

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag < EMTextFieldTypeEmail){
        [[self.textFieldCollection objectAtIndex:textField.tag+1] becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
    }
    
return TRUE;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    UILabel* hidingLabel = [self.hidingLabelCollection objectAtIndex:textField.tag];
    hidingLabel.text = newString;
    
    if (textField.tag == EMTextFieldTypeEmail){
        NSCharacterSet* wrongCharacters = [NSCharacterSet characterSetWithCharactersInString:@"~!#$%^&*()_+\"№;%:?*\\/|\'"];
        NSMutableArray* emailArray = [newString componentsSeparatedByCharactersInSet:wrongCharacters];
        if ([emailArray count] > 1){
            return FALSE;
        }
        emailArray = [newString componentsSeparatedByString:@"@"];
        if ([emailArray count] > 2){
            return FALSE;
        }
            
    }
    
    if (textField.tag == EMTextFieldTypePhone){
        
        NSCharacterSet* digitsCharactersInverted = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        NSArray* components = [string componentsSeparatedByCharactersInSet:digitsCharactersInverted];
        
        if ([components count] > 1){
            return FALSE;
        }
        
        NSArray* number = [newString componentsSeparatedByCharactersInSet:digitsCharactersInverted];
        newString = [number componentsJoinedByString:@""];
        
        NSMutableString* resultString = [[NSMutableString alloc] init];
        
        static const int localNumberMax = 7;
        static const int localAreaMax = 3;
        static const int countryNumberMax = 2;
        
        if ([newString length] > localNumberMax + localAreaMax + countryNumberMax){
            return FALSE;
        }
        
        NSInteger localNumber = MIN([newString length], localNumberMax);
        
        if (localNumber > 0){
            NSString* number = [newString substringFromIndex:[newString length] - localNumber];
            
            [resultString appendString:number];
            if ([resultString length] > 3){
                [resultString insertString:@"-" atIndex:3];
            }
        }
        
        if ([newString length] > localNumberMax){
            
            NSInteger areaIndex = MIN([newString length] - localNumberMax,localAreaMax);
            
            NSRange areaRange = NSMakeRange([newString length] - localNumberMax - areaIndex, areaIndex);
            
            NSString* areaNumber = [newString substringWithRange:areaRange];
            NSString* areaString = [NSString stringWithFormat:@"(%@) ", areaNumber];
            [resultString insertString:areaString atIndex:0];
        }
        
        if ([newString length] > localNumberMax + localAreaMax){
            NSString* countryNumber = [newString substringToIndex:[newString length] - localNumberMax - localAreaMax];
            countryNumber = [NSString stringWithFormat:@"+%@ ", countryNumber];
            
            [resultString insertString:countryNumber atIndex:0];
        }
        
        textField.text = resultString;
        
        return FALSE;
    }
    
    else{
        return TRUE;
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    UILabel* hidingLabel = [self.hidingLabelCollection objectAtIndex:textField.tag];
    hidingLabel.text = @"";
    
    return TRUE;
}

@end
