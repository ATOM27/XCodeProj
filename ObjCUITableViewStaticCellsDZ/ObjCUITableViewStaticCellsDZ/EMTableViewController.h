//
//  EMTableViewController.h
//  ObjCUITextFieldDZ
//
//  Created by Eugene Mekhedov on 31.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;



- (IBAction)actionTextFieldChanged:(UITextField *)sender;

@end
