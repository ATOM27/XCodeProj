//
//  ViewController.m
//  ObjCUIView2.1
//
//  Created by Eugene Mekhedov on 16.06.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ViewController ()

@property(strong, nonatomic) UIView* boardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    CGSize boardSize = CGSizeMake(MIN(self.view.bounds.size.height, self.view.bounds.size.width),
                                  MIN(self.view.bounds.size.height, self.view.bounds.size.width));
    
    CGPoint boardPoint = CGPointMake((self.view.bounds.size.width - boardSize.width)/2, (self.view.bounds.size.height - boardSize.height)/2);
    
    CGRect boardRect = CGRectMake(boardPoint.x, boardPoint.y, boardSize.width, boardSize.height);
    
    self.boardView  = [[UIView alloc] initWithFrame:boardRect];
    
    [self.view addSubview:self.boardView];
    
    self.boardView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |
                                      UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    for (NSInteger i = 0; i < 8; i++){
        for (NSInteger j = 0; j < 8; j++){
            CGRect cellRect = CGRectMake(i * self.boardView.bounds.size.width/8, j * self.boardView.bounds.size.height/8, self.boardView.bounds.size.width/8, self.boardView.bounds.size.height/8);
            UIView* cellView = [[UIView alloc] initWithFrame:cellRect];
            UIView* checker;
            if ((i+j)%2 == 0){
                cellView.backgroundColor = [UIColor blackColor];
                
                if (j < 3){
                    checker =[self makeCheckerWithColor:[UIColor redColor] andParrentSubview:self.boardView x:i y:j square: cellView];
                }
                
                if (j > 4){
                    checker = [self makeCheckerWithColor:[UIColor greenColor] andParrentSubview:self.boardView x:i y:j square:cellView];
                }
            }
            else
                cellView.backgroundColor = [UIColor whiteColor];
            [self.boardView addSubview:cellView];
            [self.boardView bringSubviewToFront:checker];
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(void)viewDidLayoutSubviews{
    if (UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
        for (UIView* square in self.boardView.subviews){
            if (![square.backgroundColor isEqual:[UIColor blackColor]] && ![square.backgroundColor isEqual:[UIColor whiteColor]] && ![square.backgroundColor isEqual:[UIColor redColor]] && ![square.backgroundColor isEqual:[UIColor greenColor]]){
                square.backgroundColor = [UIColor blackColor];
            }
        }

    }
    else{
        for (UIView* square in self.boardView.subviews){
            if ([square.backgroundColor isEqual:[UIColor blackColor]]){
                square.backgroundColor = [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:drand48()];
            }
        }
    }
    
    
    NSMutableArray* redArray = [[NSMutableArray alloc] init];
    NSMutableArray* greenArray = [[NSMutableArray alloc] init];
    for (UIView* checker in self.boardView.subviews){
        if (checker.backgroundColor == [UIColor redColor])
            [redArray addObject:checker];
        if (checker.backgroundColor == [UIColor greenColor]){
            [greenArray addObject:checker];
        }
    }
    
    NSInteger howManyChecks = arc4random()%24;
    for (NSInteger check = 0; check < howManyChecks; check++){
        UIView* redChecker = [redArray objectAtIndex:arc4random()%[redArray count]];
        UIView* greenChecker = [greenArray objectAtIndex:arc4random()%[greenArray count]];
        CGRect tempRect = redChecker.frame;
        redChecker.frame = greenChecker.frame;
        greenChecker.frame = tempRect;
    }

    
}

-(UIView*)makeCheckerWithColor:(UIColor*) color andParrentSubview:(UIView*) view x:(NSInteger) i y:(NSInteger) j square: (UIView*) square{
    CGRect checkerRect = CGRectMake(i * square.bounds.size.width, j * square.bounds.size.height, view.bounds.size.width/16, view.bounds.size.height/16);
    checkerRect.origin.x += square.bounds.size.width/4;
    checkerRect.origin.y += square.bounds.size.height/4;
    UIView* checker = [[UIView alloc] initWithFrame:checkerRect];
    checker.backgroundColor = color;
    [view addSubview:checker];
    [view bringSubviewToFront:checker];
    return checker;
}

@end
