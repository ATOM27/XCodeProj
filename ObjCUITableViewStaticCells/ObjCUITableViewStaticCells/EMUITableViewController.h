//
//  EMUITableViewController.h
//  ObjCUITableViewStaticCells
//
//  Created by Eugene Mekhedov on 28.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMUITableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *levelSegmentedControl;

@property (weak, nonatomic) IBOutlet UISwitch *shadowSwitch;

@property (weak, nonatomic) IBOutlet UISegmentedControl *detalizationSegmentedControl;

@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;


- (IBAction)actionTextChanged:(UITextField *)sender;
- (IBAction)actionValueChanged:(id)sender;

@end
