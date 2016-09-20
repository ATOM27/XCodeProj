//
//  EMDatePickerViewController.h
//  ObjCUIPopoverControllerDZ
//
//  Created by Eugene Mekhedov on 20.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMDatePickerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) id delegate;

- (IBAction)actionDateChanged:(UIDatePicker *)sender;

@end
