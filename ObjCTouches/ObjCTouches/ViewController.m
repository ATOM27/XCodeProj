//
//  ViewController.m
//  ObjCTouches
//
//  Created by Eugene Mekhedov on 25.06.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView* draggingView;
@property (assign, nonatomic) CGPoint delta;
//@property (strong, nonatomic) UIView* testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (NSInteger i = 1; i <= 8; i++){
        UIView* testView = [[UIView alloc] initWithFrame:CGRectMake(100, 110 * i, 90, 90)];
        testView.backgroundColor = [self randomColor];
        [self.view addSubview:testView];
    }
    //self.testView = testView;
}

-(UIColor*) randomColor {
    return [UIColor colorWithHue:drand48() saturation:drand48() brightness:drand48() alpha:1.f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    for (UITouch* touch in touches){
        
        CGPoint point = [touch locationInView:self.view];
        NSLog(@"touchesBegan in point %@", NSStringFromCGPoint(point));
        
        //CGPoint pointInTestView = [touch locationInView:self.testView];
        //NSLog(@"inside = %d", [self.testView pointInside:pointInTestView withEvent:event]);
        
        UIView* newView = [self.view hitTest:point withEvent:event];
        
        if (![newView isEqual:self.view]){
            self.draggingView = newView;
            
            [self.view bringSubviewToFront:self.draggingView];
            
            [UIView animateWithDuration:0.3
                             animations:^{
                                 self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                                 self.draggingView.alpha = 0.5f;
                             }];
            
            
            
            CGPoint pointInDraggingView = [touch locationInView:self.draggingView];
            
            self.delta = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - pointInDraggingView.x, CGRectGetMidY(self.draggingView.bounds) - pointInDraggingView.y);
            
            
            NSLog(@"bounds: %@\n point: %@", NSStringFromCGPoint(self.delta), NSStringFromCGPoint(pointInDraggingView));
            
            

        }
        else{
            self.draggingView = nil;
        }
        
    }
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    for (UITouch* touch in touches){
        
        CGPoint point = [touch locationInView:self.view];
        NSLog(@"touchesMoved in point %@", NSStringFromCGPoint(point));
        if (self.draggingView){
            
            
            
            
            self.draggingView.center = CGPointMake(point.x + self.delta.x,
                                                   point.y + self.delta.y);
            
            
            
            
        }
        
    }

}

-(void) endAnimation {
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity;
                         self.draggingView.alpha = 1.f;
                     }];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    for (UITouch* touch in touches){
        
        CGPoint point = [touch locationInView:self.view];
        NSLog(@"touchesEnded in point %@", NSStringFromCGPoint(point));
       
        [self endAnimation];
        
        self.draggingView = nil;
        
    }


}
- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    for (UITouch* touch in touches){
        
        CGPoint point = [touch locationInView:self.view];
        NSLog(@"touchesCancelled in point %@", NSStringFromCGPoint(point));
        
        [self endAnimation];
        
        self.draggingView = nil;
        
    }

}


@end
