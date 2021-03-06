//
//  ViewController.m
//  ObjCUIButtonsDZ
//
//  Created by Eugene Mekhedov on 18.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) BOOL checkerForLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (UIButton* currentButton in self.buttonsCollection){
        [currentButton.layer setBorderWidth:0.5f];
        [currentButton.layer setBorderColor:[[UIColor grayColor] CGColor]];
    }
    self.checkerForLabel = TRUE;
    
    
    // PLAY WITH BLUR
//    UIBlurEffect* blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//    UIVisualEffectView* blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    blurEffectView.frame = self.view.bounds;
//    [self.view addSubview:blurEffectView];
//    [self.view sendSubviewToBack:blurEffectView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DRY

-(void) DRYOpearionsWithPrinting:(CGFloat) result{
    if (result - floorf(result) > 0){
        self.indicatorLabel.text = [NSString stringWithFormat:@"%.5f", result];
    }
    else{
        self.indicatorLabel.text = [NSString stringWithFormat:@"%.0f", result];
    }
    self.firstArgument = [NSNumber numberWithFloat:result];
}

#pragma mark - Color

-(UIColor*) randomColor{
    return [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:((arc4random() % 128 / 256.0 ) + 0.5) brightness:( (arc4random() % 128 / 256.0 ) + 0.5) alpha:1.f];
}

#pragma mark - Actions

- (IBAction)actionTouch:(UIButton *)sender forEvent:(UIEvent *)event {
    
    if (self.checkerForLabel){
        self.indicatorLabel.text = @"";
        self.checkerForLabel = FALSE;
    }
    self.indicatorLabel.text = [self.indicatorLabel.text stringByAppendingString:sender.titleLabel.text];
    NSLog(@"%.5f", [self.indicatorLabel.text floatValue]);
}

- (IBAction)actionClearLabel:(id)sender forEvent:(UIEvent *)event {
    self.indicatorLabel.text = @"0";
    self.checkerForLabel = TRUE;
    self.firstArgument = nil;
}

- (IBAction)actionOperations:(UIButton *)sender forEvent:(UIEvent *)event {
    
    if (self.firstArgument == nil){
        self.firstArgument = [NSNumber numberWithFloat:[self.indicatorLabel.text floatValue]];
    }
    self.operationSign = sender.tag;
    self.checkerForLabel = TRUE;
}

- (IBAction)actionResult:(UIButton *)sender forEvent:(UIEvent *)event {
    self.secondArgument = [self.indicatorLabel.text floatValue];
    CGFloat result;
    
    switch (self.operationSign) {
        case EMActionSumm:
            result = [self.firstArgument floatValue] + self.secondArgument;
            [self DRYOpearionsWithPrinting:result];
            break;
            
        case EMActionSubtraction:
            result = [self.firstArgument floatValue] - self.secondArgument;
            [self DRYOpearionsWithPrinting:result];
            break;
            
        case EMActionDivision:
            result = [self.firstArgument floatValue] / self.secondArgument;
            [self DRYOpearionsWithPrinting:result];
            break;
            
        case EMActionMultiply:
            result = [self.firstArgument floatValue] * self.secondArgument;
            [self DRYOpearionsWithPrinting:result];
            break;
            
        default:
            break;
    }
}

- (IBAction)actionDot:(UIButton *)sender forEvent:(UIEvent *)event {
    
    if([self.indicatorLabel.text isEqual:@"0"]){
        self.indicatorLabel.text = @"0.";
        self.checkerForLabel = FALSE;
    }
    else{
        self.indicatorLabel.text = [self.indicatorLabel.text stringByAppendingString:@"."];
    }
}

#pragma mark - Orientation

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
@end
