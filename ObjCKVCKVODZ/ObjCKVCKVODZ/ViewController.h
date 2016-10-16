//
//  ViewController.h
//  ObjCKVCKVODZ
//
//  Created by Eugene Mekhedov on 05.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastName;
@property (strong, nonatomic) IBOutlet UILabel *dateOfBirthDate;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;
- (IBAction)actionReset:(id)sender;

@end

