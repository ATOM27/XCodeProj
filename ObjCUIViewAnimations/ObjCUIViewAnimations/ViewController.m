//
//  ViewController.m
//  ObjCUIViewAnimations
//
//  Created by Eugene Mekhedov on 22.06.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* squareArray;
@property (strong, nonatomic) NSMutableArray* cornerSquareArray;
@property (assign, nonatomic) NSInteger heightAndWeigthOfSquare;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.heightAndWeigthOfSquare = 50;
/*    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.bounds) / 2, 125);
                         /*view.transform*/// CGAffineTransform scale = CGAffineTransformMakeRotation(M_PI);
                         /*view.transform*//* CGAffineTransform rotate = CGAffineTransformMakeScale(0.5, 0.5);
                         CGAffineTransform trasform = CGAffineTransformConcat(scale, rotate);
                         
                         view.transform = trasform;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         NSLog(@"It's finished with code %d", finished);
                         
                     }];
    
    #pragma mark - STOP ANIMATION -
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CALayer * presLayer = (CALayer *)view.layer.presentationLayer;
        view.layer.position = [presLayer position];
                                            
                                            
        [view.layer removeAllAnimations];
        
        
        [UIView animateWithDuration:2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             
                             view.center = CGPointMake(self.view.center.x, self.view.center.y);
                             //view.transform = CGAffineTransformMakeRotation(M_PI);
                             //view.transform = CGAffineTransformMakeScale(2, 0.5);
                             
                         }
                         completion:^(BOOL finished) {
                             
                             NSLog(@"It's finished with code %d", finished);
                             
                         }];
    });

    */
    CGFloat somePoint = (CGRectGetHeight(self.view.bounds) / 4);
    self.squareArray = [[NSMutableArray alloc] init];
    self.cornerSquareArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 4; i++){
        CGSize squareSize = CGSizeMake(self.heightAndWeigthOfSquare, self.heightAndWeigthOfSquare);
        CGPoint squarePoint = CGPointMake(CGRectGetMinX(self.view.bounds) + 30, (somePoint) * i + somePoint / 3);
        CGRect squareRect = CGRectMake(squarePoint.x, squarePoint.y, squareSize.width, squareSize.height);
        UIView* squareView = [[UIView alloc] initWithFrame:squareRect];
        
        squareView.backgroundColor = [self returnRandomColorWithoutAlpha];
        [self.squareArray addObject:squareView];
        [self.view addSubview:squareView];
    }
    
    for (NSInteger i = 0; i < self.squareArray.count; i++){
        [UIView animateWithDuration:5
                              delay:0
                            options:i << 16 | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                         animations:^{
                             UIView* view = [self.squareArray objectAtIndex:i];
                             view.center = CGPointMake(CGRectGetMaxX(self.view.bounds) - 100, (somePoint) * i + somePoint / 3);
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"Animashion finished with code = %d", finished);
                         }];
    }
    
    NSArray* cornerViewRect = [[NSArray alloc] initWithObjects:
                               NSStringFromCGPoint(CGPointMake(CGRectGetMinX(self.view.bounds),CGRectGetMinY(self.view.bounds))),
                               NSStringFromCGPoint(CGPointMake(CGRectGetMaxX(self.view.bounds) - self.heightAndWeigthOfSquare, CGRectGetMinY(self.view.bounds))),
                               NSStringFromCGPoint(CGPointMake(CGRectGetMaxX(self.view.bounds) - self.heightAndWeigthOfSquare, CGRectGetMaxY(self.view.bounds) - self.heightAndWeigthOfSquare)),
                               NSStringFromCGPoint(CGPointMake(CGRectGetMinX(self.view.bounds), CGRectGetMaxY(self.view.bounds) - self.heightAndWeigthOfSquare)),nil];
    
    NSArray* colorForCornerView = [[NSArray alloc] initWithObjects:
                                   [UIColor redColor],
                                   [UIColor yellowColor],
                                   [UIColor greenColor],
                                   [UIColor blueColor], nil];
    
    for (NSInteger i = 0; i < 4; i++){
        
        CGRect cornerRectView = CGRectMake(CGPointFromString([cornerViewRect objectAtIndex:i]).x,
                                           CGPointFromString([cornerViewRect objectAtIndex:i]).y,
                                           self.heightAndWeigthOfSquare,
                                           self.heightAndWeigthOfSquare);
        NSLog(@"%@", [cornerViewRect objectAtIndex:i]);
        UIView* cornenView = [[UIView alloc] initWithFrame:cornerRectView];
        cornenView.backgroundColor = [colorForCornerView objectAtIndex:i];
        [self.cornerSquareArray addObject:cornenView];
        [self.view addSubview:cornenView];
        
    }
    
    [self fromCornerToCorner:self.cornerSquareArray squarePointsInArray:cornerViewRect heightAndWeight:self.heightAndWeigthOfSquare colorOfSquare:colorForCornerView];
    
    UIImage* image1 = [UIImage imageNamed:@"0b5e79f23aedec33e0554178edd629b5.jpeg"];
    UIImage* image2 = [UIImage imageNamed:@"21890995.jpg"];
    
    NSArray* images = [[NSArray alloc] initWithObjects:image1, image2, nil];
    
    UIImageView* imageView = [[UIImageView alloc] init];
    
    CGPoint squarePoint = CGPointMake(CGRectGetMinX(self.view.bounds) + 30, (somePoint) + somePoint / 3);
    imageView.frame = CGRectMake(squarePoint.x, squarePoint.y, 100, 100);

    imageView.animationImages = images;
    imageView.animationDuration = 1.f;
    [imageView startAnimating];
    
    [self.view addSubview:imageView];
    
}

-(UIColor*) returnRandomColorWithoutAlpha {
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1.f];
}

-(void) fromCornerToCorner:(NSMutableArray*) cornerSqareArray squarePointsInArray:(NSArray*) cornerViewRect heightAndWeight:(NSInteger) heightAndWeigthOfSquare colorOfSquare: (NSArray*) colorForCornerView{
    for (UIView* view in cornerSqareArray){
        [UIView animateWithDuration:2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat
                         animations:^{
                             NSInteger index = [cornerViewRect indexOfObject:NSStringFromCGPoint(view.frame.origin)];
                             if (index == 3){
                                 index = 0;
                             }
                             else{
                                 index++;
                             }
                             
                             view.frame = CGRectMake(CGPointFromString([cornerViewRect objectAtIndex:index]).x,
                                                     CGPointFromString([cornerViewRect objectAtIndex:index]).y,
                                                     heightAndWeigthOfSquare,
                                                     heightAndWeigthOfSquare);
                             view.backgroundColor = [colorForCornerView objectAtIndex:index];
                             view.transform = CGAffineTransformMakeRotation(-3.1415);
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"The animation is finished with code = %d", finished);
                         }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
