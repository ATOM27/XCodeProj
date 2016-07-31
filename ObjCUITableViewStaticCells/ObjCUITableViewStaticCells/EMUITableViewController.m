//
//  EMUITableViewController.m
//  ObjCUITableViewStaticCells
//
//  Created by Eugene Mekhedov on 28.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUITableViewController.h"

static NSString* kSettingsLogin = @"login";
static NSString* kSettingsPassword = @"password";
static NSString* kSettingsLevel = @"level";
static NSString* kSettingsShadows = @"shadows";
static NSString* kSettingsDetalization = @"detalization";
static NSString* kSettingsSound = @"sound";
static NSString* kSettingsMusic = @"music";

@interface EMUITableViewController ()

@end

@implementation EMUITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSettings];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

-(void) notificationKeyboardWillShow:(NSNotification*) notification {
    
    NSLog(@"notificationKeyboardWillShow: /n %@", notification.userInfo);
    
}

-(void) notificationKeyboardWillHide:(NSNotification*) notification{
    
    NSLog(@"notificationKeyboardWillHide: /n %@", notification.userInfo);

}

#pragma mark - Save and Load

-(void) saveSettings {

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.loginTextField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordTextField.text forKey:kSettingsPassword];
    
    [userDefaults setInteger:self.levelSegmentedControl.selectedSegmentIndex forKey:kSettingsLevel];
    [userDefaults setInteger:self.shadowSwitch.isOn forKey:kSettingsShadows];
    [userDefaults setBool:self.detalizationSegmentedControl.selectedSegmentIndex forKey:kSettingsDetalization];
    
    [userDefaults setFloat:self.soundSlider.value forKey:kSettingsSound];
    [userDefaults setFloat:self.musicSlider.value forKey:kSettingsMusic];
    
    [userDefaults synchronize];
}

-(void) loadSettings {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginTextField.text = [userDefaults objectForKey:kSettingsLogin];
    self.passwordTextField.text = [userDefaults objectForKey:kSettingsPassword];
    
    self.levelSegmentedControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsLevel];
    self.shadowSwitch.on = [userDefaults boolForKey:kSettingsShadows];
    self.detalizationSegmentedControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsDetalization];
    
    self.soundSlider.value = [userDefaults floatForKey:kSettingsSound];
    self.musicSlider.value = [userDefaults floatForKey:kSettingsMusic];
    
    [userDefaults synchronize];

}

#pragma mark - Actions

- (IBAction)actionTextChanged:(UITextField *)sender {
    [self saveSettings];
}

- (IBAction)actionValueChanged:(id)sender {
    [self saveSettings];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:self.loginTextField]){
        [self.passwordTextField becomeFirstResponder];
    }
    else{
        [self.passwordTextField resignFirstResponder];
    }
    return TRUE;
}
@end
