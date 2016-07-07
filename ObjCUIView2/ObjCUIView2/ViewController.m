//
//  ViewController.m
//  ObjCUIView2
//
//  Created by Eugene Mekhedov on 10.05.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 200, 50)];
    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8f];
    [self.view addSubview:view1];

    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(145, 145, 50, 400)];
    view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8f];
    [self.view addSubview:view2];
    
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view3.backgroundColor = [UIColor yellowColor];
    [view2 addSubview:view3];
    
    
    view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                             UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)){
        self.view.backgroundColor = [UIColor whiteColor];
    }
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
}

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    UIInterfaceOrientation toOrientation = [[UIDevice currentDevice] orientation];
    if (toOrientation == UIInterfaceOrientationPortrait){
        NSLog(@"Portrait");
    }
    if (toOrientation == UIInterfaceOrientationMaskLandscape){
        NSLog(@"Landskape");
    }
}


@end
