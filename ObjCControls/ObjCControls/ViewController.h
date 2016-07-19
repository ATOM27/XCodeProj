//
//  ViewController.h
//  ObjCControls
//
//  Created by Eugene Mekhedov on 19.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UISlider *infoSlider;
@property (weak, nonatomic) IBOutlet UISlider *redComponentsSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueComponentSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSchemeControl;

- (IBAction)actionForChangeBackgroundColor:(id)sender;
- (IBAction)actionInfoLabel:(UISlider *)sender;
- (IBAction)actionEnable:(UISwitch *)sender;

@end

