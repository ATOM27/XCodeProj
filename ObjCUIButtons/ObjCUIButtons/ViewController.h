//
//  ViewController.h
//  ObjCUIButtons
//
//  Created by Eugene Mekhedov on 16.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;


- (IBAction)actionButtonOnStoryboard:(UIButton *)sender forEvent:(UIEvent *)event;

@end

