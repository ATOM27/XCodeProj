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
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitle:@"Button pressed" forState:UIControlStateHighlighted];
    button.frame = CGRectMake(200, 100, 50, 50);
    button.backgroundColor = [UIColor greenColor];
    
   // Can make different attributes for cusom button
    
//    NSDictionary* attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15.f],
//                                 NSForegroundColorAttributeName: [UIColor blueColor]};
//    NSAttributedString* title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
//    
//    
//    
//    
//    NSDictionary* attributesForHighlited = @{NSFontAttributeName: [UIFont systemFontOfSize:15.f],
//                                 NSForegroundColorAttributeName: [[UIColor blueColor] colorWithAlphaComponent:0.5f]};
//    NSAttributedString* titleForHighlited = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributesForHighlited];
//    
//    
//    
//    
//    [button setAttributedTitle:title forState:UIControlStateNormal];
//    [button setAttributedTitle:titleForHighlited forState:UIControlStateHighlighted];
    
    
    // Insets
    
    //UIEdgeInsets insets = UIEdgeInsetsMake(100, 100, 0, 0);
    //button.titleEdgeInsets = insets;
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(actionTest:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(actionTestOutside:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(void) actionTest:(UIButton*) button{

    NSLog(@"Button Pressed! %lu", [button.titleLabel.text length]);
    button.frame = CGRectMake(150, 100, 150, 50);
    
}

-(void) actionTestOutside:(UIButton*) button{
    
    NSLog(@"Button Pressed Outside!");
    button.frame = CGRectMake(200, 100, 50, 50);

    
}

- (IBAction)actionButtonOnStoryboard:(UIButton *)sender forEvent:(UIEvent *)event {
    NSLog(@"Button created on storyboard!");
    self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", (long)sender.tag];
}
@end
