//
//  ViewController.m
//  ObjCControlsDZ
//
//  Created by Eugene Mekhedov on 19.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, EMTypeOfBall){
    EMTypeOfBallBasketball,
    EMTypeOfBallFootball,
    EMTypeOfBallValleyball
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.speedOfAnimation = self.infoSlider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

-(void) makeRotationWithImageView:(UIImageView*) imageView onAngle:(CGFloat) angle{
    
    [UIView animateWithDuration:3 * self.speedOfAnimation
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         imageView.transform = CGAffineTransformRotate(imageView.transform, angle);
                     }
                     completion:^(BOOL finished) {
                         
                         if (self.rotationSwitch.isOn){
                             __weak UIImageView* weakImageView = imageView;
                             [self makeRotationWithImageView:weakImageView onAngle:angle];
                         }
                     }];

}

-(void) makeScaleWithImageView:(UIImageView*) imageView sx:(CGFloat) sx sy:(CGFloat) sy{
    
    [UIView animateWithDuration:3 * self.speedOfAnimation
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         imageView.transform = CGAffineTransformScale(imageView.transform, sx, sy);
                     }
                     completion:^(BOOL finished) {
                         
                         if (self.scaleSwitch.isOn){
                             __weak UIImageView* weakImageView = imageView;
                             [self makeScaleWithImageView:weakImageView sx:sx sy:sy];
                         }
                     }];
    
}

-(void) makeTranslationWithImageView:(UIImageView*) imageView{
    
    CGPoint pointToMove = CGPointMake(arc4random() % (NSInteger)CGRectGetMaxX(self.parentToImageView.bounds),
                                      arc4random() % (NSInteger)CGRectGetMaxY(self.parentToImageView.bounds));


    [UIView animateWithDuration:3 * self.speedOfAnimation
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         imageView.center = pointToMove;
                     }
                     completion:^(BOOL finished) {
                         
                         if (self.translationSwitch.isOn){
                             __weak UIImageView* weakImageView = imageView;
                             [self makeTranslationWithImageView:weakImageView];
                         }
                     }];
    
}
#pragma mark - Actions

- (IBAction)actionChangeBall:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case EMTypeOfBallBasketball:
            self.ballImageView.image = [UIImage imageNamed:@"basketball.png"];
            break;
            
        case EMTypeOfBallFootball:
            self.ballImageView.image = [UIImage imageNamed:@"football.png"];
            break;
            
        case EMTypeOfBallValleyball:
            self.ballImageView.image = [UIImage imageNamed:@"volleyball.png"];
            break;
        default:
            break;
            
    }
}

- (IBAction)actionMakeRotation:(UISwitch *)sender {
    if (sender.isOn){
        [self makeRotationWithImageView:self.ballImageView onAngle:M_PI];
    }
}

- (IBAction)actionMakeScale:(UISwitch *)sender {
    if (sender.isOn){
        [self makeScaleWithImageView:self.ballImageView sx:1.2f sy:1.2f];
    }
    else{
        [UIView animateWithDuration:3
                         animations:^{
                             self.ballImageView.transform = CGAffineTransformIdentity;
                         }];
    }
}

- (IBAction)actionMakeTranslation:(UISwitch *)sender {
    if (sender.isOn){
        [self makeTranslationWithImageView:self.ballImageView];
    }
}

- (IBAction)actionSpeedChange:(UISlider *)sender {
    self.speedOfAnimation = sender.value;
}
@end
