//
//  ViewController.h
//  ObjCUIPopoverControllerDZ
//
//  Created by Eugene Mekhedov on 20.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

typedef NS_ENUM(NSInteger, UITextFieldName){
    UITextFieldNameName,
    UITextFieldNameSurname,
    UITextFieldNameBirthDate,
    UITextFieldNameEducation
};

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;
@property (strong, nonatomic) NSString* date;



@end

