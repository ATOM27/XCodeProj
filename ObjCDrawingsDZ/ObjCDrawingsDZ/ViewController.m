//
//  ViewController.m
//  ObjCDrawingsDZ
//
//  Created by Eugene Mekhedov on 12.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#include "EMStar.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet EMStar *drawingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.drawingView init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Orientation

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [self.drawingView setNeedsDisplay];
}





@end
