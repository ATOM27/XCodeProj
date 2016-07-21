//
//  ViewController.h
//  ObjCUITextFieldPart1
//
//  Created by Eugene Mekhedov on 20.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *secondNameField;

- (IBAction)actionTextChanged:(UITextField *)sender;

@end
 
