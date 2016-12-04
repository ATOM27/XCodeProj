//
//  EMAddUserTableViewController.h
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 04.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMAddUserTableViewController : UITableViewController

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *addUserTextField;

- (IBAction)actionAddUser:(id)sender;
@end
