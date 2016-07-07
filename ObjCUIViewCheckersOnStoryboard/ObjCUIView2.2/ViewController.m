//
//  ViewController.m
//  ObjCUIView2.2
//
//  Created by Eugene Mekhedov on 17.06.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (UIView* cell in self.blackCells){
        cell.backgroundColor = [UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*) returnRandomColorToBlackCell{
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:drand48()];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    NSInteger minSize = MIN(size.height, size.width);
    if (size.width == minSize){
        for (UIView* cell in self.blackCells){
            cell.backgroundColor = [UIColor blackColor];
        }
    }
    else{
        for (UIView* cell in self.blackCells){
            cell.backgroundColor = [self returnRandomColorToBlackCell];
        }
    }
}

@end
