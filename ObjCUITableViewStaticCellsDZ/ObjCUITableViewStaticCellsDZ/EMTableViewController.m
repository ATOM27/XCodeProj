//
//  EMTableViewController.m
//  ObjCUITextFieldDZ
//
//  Created by Eugene Mekhedov on 31.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMTableViewController.h"

static NSString* kSettingsName = @"name";
static NSString* kSettingsSecondName = @"secondName";
static NSString* kSettingsLogin = @"login";
static NSString* kSettingsPassword = @"password";
static NSString* kSettingsPhone = @"phone";
static NSString* kSettingsEmail = @"email";

typedef NS_ENUM(NSInteger, EMTextFieldType){
    EMTextFieldTypeName,
    EMTextFieldTypeSecondName,
    EMTextFieldTypeLogin,
    EMTextFieldTypePassword,
    EMTextFieldTypePhone,
    EMTextFieldTypeEmail
};

@interface EMTableViewController ()

@end

@implementation EMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSettings];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Save and Load

-(void) loadSettings {
    NSUserDefaults* userDafaults = [NSUserDefaults standardUserDefaults];
    
    self.nameTextField.text = [userDafaults objectForKey:kSettingsName];
    self.secondNameTextField.text = [userDafaults objectForKey:kSettingsSecondName];
    self.loginTextField.text = [userDafaults objectForKey:kSettingsLogin];
    self.passwordTextField.text = [userDafaults objectForKey:kSettingsPassword];
    self.phoneTextField.text = [userDafaults objectForKey:kSettingsPhone];
    self.emailTextField.text = [userDafaults objectForKey:kSettingsEmail];
}

-(void) saveSettings {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.nameTextField.text forKey:kSettingsName];
    [userDefaults setObject:self.secondNameTextField.text forKey:kSettingsSecondName];
    [userDefaults setObject:self.loginTextField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordTextField.text forKey:kSettingsPassword];
    [userDefaults setObject:self.phoneTextField.text forKey:kSettingsPhone];
    [userDefaults setObject:self.emailTextField.text forKey:kSettingsEmail];
    
    [userDefaults synchronize];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag < EMTextFieldTypeEmail){
        [[self.textFieldCollection objectAtIndex:textField.tag+1] becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return TRUE;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
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

#pragma mark - Actions

- (IBAction)actionTextFieldChanged:(UITextField *)sender {
    [self saveSettings];
}
@end
