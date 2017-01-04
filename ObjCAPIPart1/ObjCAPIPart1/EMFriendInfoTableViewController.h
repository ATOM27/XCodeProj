//
//  EMFriendInfoTableViewController.h
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 18.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMUser.h"

@interface EMFriendInfoTableViewController : UITableViewController

@property (strong, nonatomic) EMUser* user;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImage;
@property (strong, nonatomic) IBOutlet UILabel *initialsLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *onlineLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;

@end
