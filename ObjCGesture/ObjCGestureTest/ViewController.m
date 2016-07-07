//
//  ViewController.m
//  ObjCGestureTest
//
//  Created by Eugene Mekhedov on 03.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIView* testView;
@property (assign, nonatomic) CGFloat testScale;
@property (assign, nonatomic) CGFloat testRotation;
@property (assign, nonatomic) CGPoint delta;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                         action:@selector(handleTap:)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleDoubleTap:)];
    
    [self.view addGestureRecognizer:doubleTapGesture];
    doubleTapGesture.numberOfTapsRequired = 2;
    
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50,
                                                                CGRectGetMidY(self.view.bounds) - 50,
                                                                100, 100)];
        view.backgroundColor = [self randomColor];
        
        [self.view addSubview:view];
    self.testView = view;
    
    NSLog(@"bounds: %@", NSStringFromCGRect(self.testView.bounds));
    
    UIPinchGestureRecognizer* pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(handlePinch:)];
    
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
    UIRotationGestureRecognizer* rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                                action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
    
    UISwipeGestureRecognizer* verticalSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(handleVerticalSwipe:)];
    verticalSwipe.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    verticalSwipe.delegate = self;
    [self.view addGestureRecognizer:verticalSwipe];
   
    
    UISwipeGestureRecognizer* horizontalSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(handleHorizontalSwipe:)];
    horizontalSwipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    horizontalSwipe.delegate = self;
    [self.view addGestureRecognizer:horizontalSwipe];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gestures

-(void) handleTap:(UITapGestureRecognizer*) tapGesture{
    
    CGPoint pointInMainView = [tapGesture locationInView:self.view];
    NSLog(@"Tap: %@", NSStringFromCGPoint(pointInMainView));

    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.testView.backgroundColor = [self randomColor];
                         self.testView.transform = CGAffineTransformScale(self.testView.transform, 1.2f, 1.2f);
                     }];
}

-(void) handleDoubleTap:(UIGestureRecognizer*) tapGesture{
    NSLog(@"Double Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.testView.backgroundColor = [self randomColor];
                         self.testView.transform = CGAffineTransformScale(self.testView.transform, 0.8f, 0.8f);
                     }];
}

-(void) handlePinch:(UIPinchGestureRecognizer*) pinchGesture{
    NSLog(@"Pich scale: %1.3f", pinchGesture.scale);
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan){
        self.testScale = 1.f;
    }
    
    CGFloat newScale = 1.f + pinchGesture.scale - self.testScale;
    self.testView.transform = CGAffineTransformScale(self.testView.transform, newScale, newScale);
    
    self.testScale = pinchGesture.scale;
     NSLog(@"bounds: %@", NSStringFromCGRect(self.testView.bounds));
}

-(void) handleRotation:(UIRotationGestureRecognizer*) rotationGesture{
    NSLog(@"Rotation Gesture: %1.3f", rotationGesture.rotation);
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan){
        self.testRotation = 0.f;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testRotation;
    self.testView.transform = CGAffineTransformRotate(self.testView.transform, newRotation);
    
    self.testRotation = rotationGesture.rotation;
}

-(void) handlePan:(UIPanGestureRecognizer*) panGesture{
    
    CGPoint pointInMainView = [panGesture locationInView:self.view];
    CGPoint pointInCurrentView = [panGesture locationInView:self.testView];
    
    self.delta = CGPointMake(CGRectGetMidX(self.testView.bounds) - pointInCurrentView.x,
                             CGRectGetMidY(self.testView.bounds) - pointInCurrentView.y);
    
    self.testView.center = CGPointMake(pointInMainView.x + self.delta.x,
                                       pointInMainView.y + self.delta.y);
    
    NSLog(@"handlePan point: %@", NSStringFromCGPoint(pointInMainView));
    
}

-(void) handleVerticalSwipe:(UISwipeGestureRecognizer*) verticalSwipeGesture{
    NSLog(@"handleVerticalSwipe");
}

-(void) handleHorizontalSwipe:(UISwipeGestureRecognizer*) horizontalSwipeGesture{
    NSLog(@"handleHorizontalSwipe");
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
            shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]];
}

#pragma mark - Methods

-(UIColor*) randomColor{
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1.f];
}

@end
