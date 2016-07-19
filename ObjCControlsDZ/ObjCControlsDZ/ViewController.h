//
//  ViewController.h
//  ObjCControlsDZ
//
//  Created by Eugene Mekhedov on 19.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *translationSwitch;
@property (weak, nonatomic) IBOutlet UISlider *infoSlider;
@property (weak, nonatomic) IBOutlet UIImageView *ballImageView;

- (IBAction)actionChangeBall:(UISegmentedControl *)sender;
- (IBAction)actionMakeRotation:(UISwitch *)sender;
- (IBAction)actionMakeScale:(UISwitch *)sender;
- (IBAction)actionMakeTranslation:(UISwitch *)sender;


@end

