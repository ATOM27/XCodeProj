//
//  ViewController.m
//  ObjCUIButtons
//
//  Created by Eugene Mekhedov on 16.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:@"Button" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 50, 30);
    button.backgroundColor = [UIColor greenColor];
    
    NSDictionary* attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15.f],
                                 NSForegroundColorAttributeName: [UIColor blueColor]};
    NSAttributedString* title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
    
    
    
    
    NSDictionary* attributesForHighlited = @{NSFontAttributeName: [UIFont systemFontOfSize:15.f],
                                 NSForegroundColorAttributeName: [[UIColor blueColor] colorWithAlphaComponent:0.5f]};
    NSAttributedString* titleForHighlited = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributesForHighlited];
    
    
    
    
    [button setAttributedTitle:title forState:UIControlStateNormal];
    [button setAttributedTitle:titleForHighlited forState:UIControlStateHighlighted];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
