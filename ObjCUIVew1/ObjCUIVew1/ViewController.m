//
//  ViewController.m
//  ObjCUIVew1
//
//  Created by Eugene Mekhedov on 05.05.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");

}

- (void)viewWillLayoutSubviews {
    NSLog(@"viewWillLayoutSubviews");
    self.view.backgroundColor = [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:drand48()];

}

- (void)viewDidLayoutSubviews {
    NSLog(@"viewDidLayoutSubviews");
    
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape;
}



- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"willRotateToInterfaceOrientation from %d to %d", self.interfaceOrientation, toInterfaceOrientation);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"didRotateFromInterfaceOrientation from %d to %d", fromInterfaceOrientation, self.interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
