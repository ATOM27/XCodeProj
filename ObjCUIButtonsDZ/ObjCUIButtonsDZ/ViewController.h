//
//  ViewController.h
//  ObjCUIButtonsDZ
//
//  Created by Eugene Mekhedov on 18.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EMOperation){
    
    EMActionSumm            = 1,
    EMActionDivision        = 2,
    EMActionMultiply        = 3,
    EMActionSubtraction     = 4,
    
};

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonsCollection;
@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;
@property (assign, nonatomic) EMOperation operationSign;
@property (strong, nonatomic) NSNumber* firstArgument;
@property (assign, nonatomic) CGFloat secondArgument;

- (IBAction)actionTouch:(UIButton *)sender forEvent:(UIEvent *)event;

- (IBAction)actionClearLabel:(id)sender forEvent:(UIEvent *)event;

- (IBAction)actionOperations:(UIButton *)sender forEvent:(UIEvent *)event;

- (IBAction)actionResult:(UIButton *)sender forEvent:(UIEvent *)event;

- (IBAction)actionDot:(UIButton *)sender forEvent:(UIEvent *)event;
@end

