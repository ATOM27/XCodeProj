//
//  ViewController.h
//  ObjCUITextFieldDZ
//
//  Created by Eugene Mekhedov on 27.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *hidingLabelCollection;

@end

