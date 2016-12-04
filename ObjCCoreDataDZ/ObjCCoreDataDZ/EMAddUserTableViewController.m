//
//  EMAddUserTableViewController.m
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 04.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMAddUserTableViewController.h"
#import "EMDataManager.h"

typedef NS_ENUM(NSInteger, EMTextFieldType){
    EMTextFieldTypeName,
    EMTextFieldTypeLastName,
    EMTextFieldTypeEmail
};

@interface EMAddUserTableViewController ()

@end

@implementation EMAddUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag < EMTextFieldTypeEmail){
        [[self.addUserTextField objectAtIndex:textField.tag+1] becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return TRUE;
}


#pragma mark - Actions
- (IBAction)actionAddUser:(id)sender {
    
    BOOL isItOk = YES;
    
    for (UITextField* field in self.addUserTextField){
        
        if ([field.text length] == 0){
            isItOk = NO;
            UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"You need to input data in all text fields." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            break;
        }
    }
    
    if (isItOk){
        
        [[EMDataManager sharedManager] addUserWithName:[[self.addUserTextField objectAtIndex:EMTextFieldTypeName] text]
                                              lastName:[[self.addUserTextField objectAtIndex:EMTextFieldTypeLastName] text]
                                                 email:[[self.addUserTextField objectAtIndex:EMTextFieldTypeEmail] text]];
        [[[[EMDataManager sharedManager] persistentContainer] viewContext] save:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
