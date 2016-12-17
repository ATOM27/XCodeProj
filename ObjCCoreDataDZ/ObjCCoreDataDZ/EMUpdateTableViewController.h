//
//  EMUpdateTableViewController.h
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 05.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMUsers+CoreDataProperties.h"

@interface EMUpdateTableViewController : UITableViewController


@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;

@property (strong, nonatomic) NSString* firstNameString;
@property (strong, nonatomic) NSString* lastNameString;
@property (strong, nonatomic) NSString* emailString;

@property (strong, nonatomic) EMUsers* user;
- (IBAction)actionUpdate:(UIButton *)sender;
- (IBAction)actionCansel:(UIButton *)sender;

@end
