//
//  ViewController.m
//  ObjCGestureDZ
//
//  Created by Eugene Mekhedov on 05.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView* squareView;
@property (assign, nonatomic) CGFloat mainAnimationTime;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mainAnimationTime = 2.f;
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds) - 50, 100, 100)];
    
    view.backgroundColor = [self randomColor];
    [self.view addSubview:view];
    self.squareView = view;
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer* rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handleRightAndLeftSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
    
    UISwipeGestureRecognizer* leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handleRightAndLeftSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    
    UITapGestureRecognizer* doubleTapDoubleTouchGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                   action:@selector(handleDoubleTapDoubleTouchGesture:)];
    doubleTapDoubleTouchGesture.numberOfTapsRequired = 2;
    doubleTapDoubleTouchGesture.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapDoubleTouchGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gesture

-(void) handleTap:(UITapGestureRecognizer*) tapGesture{
    CGPoint pointInMainView = [tapGesture locationInView:self.view];
    
    [UIView animateWithDuration:self.mainAnimationTime
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         self.squareView.center = pointInMainView;
                         
                         [UIView animateWithDuration:self.mainAnimationTime / 2
                                               delay:0.f
                                             options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                              self.squareView.transform = CGAffineTransformScale(self.squareView.transform, 5.f, 5.f);
                                          }
                                          completion:^(BOOL finished) {
                                              NSLog(@"Plus scale");
                                          }];
                         
                         [UIView animateWithDuration:self.mainAnimationTime / 2
                                               delay:0.f
                                             options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                              self.squareView.transform = CGAffineTransformScale(self.squareView.transform, 0.2f, 0.2f);
                                          } completion:^(BOOL finished) {
                                              NSLog(@"Normal Scale");
                                          }];
                         
                     }
                     completion:^(BOOL finished) {
                     }];
}

-(void) handleRightAndLeftSwipe:(UISwipeGestureRecognizer*) rightSwipeGesture{
    NSInteger leftOrRight = (rightSwipeGesture.direction == UISwipeGestureRecognizerDirectionRight) ? 1 : -1;
    CGFloat angle = 3.141593 * leftOrRight;
    NSLog(@"%f", angle);
    [UIView animateWithDuration:0.6f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.squareView.transform = CGAffineTransformRotate(self.squareView.transform,angle);
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.6f
                                               delay:0.f
                                             options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                               self.squareView.transform = CGAffineTransformRotate(self.squareView.transform, angle);
                                          }
                                          completion:^(BOOL finished) {
                                          }];
                         
                     }];
}

-(void) handleDoubleTapDoubleTouchGesture:(UITapGestureRecognizer*) doubleTapDoubleTouchGesture{
    [self.squareView.layer removeAllAnimations];
}

#pragma mark - Methods

-(UIColor*) randomColor{
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1.f];
}

@end
