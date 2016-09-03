//
//  ViewController.m
//  ObjCUIPopoverController
//
//  Created by Eugene Mekhedov on 04.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    EMDetailsViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMDetailsViewController"];
    
    UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];
}

- (IBAction)actionPressMe:(UIButton *)sender {
}
@end
