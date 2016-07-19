//
//  ViewController.m
//  ObjCControls
//
//  Created by Eugene Mekhedov on 19.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef NS_ENUM(NSInteger, EMColorScheme){
    EMColorSchemeRGB,
    EMColorSchemeHSV
};

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.infoLabel.text = [NSString stringWithFormat:@"%.2f", self.infoSlider.value];
    
    [self changeBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

-(void) changeBackground{
    
    CGFloat red = self.redComponentsSlider.value;
    CGFloat green = self.greenComponentSlider.value;
    CGFloat blue = self.blueComponentSlider.value;
    
    self.colorLabel.text = [NSString stringWithFormat:@"{%.2f %.2f %.2f}", red, green, blue];
    
    if (self.colorSchemeControl.selectedSegmentIndex == EMColorSchemeRGB){
        self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
    }
    else{
        self.view.backgroundColor = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1.f];
    }
}

#pragma mark - Actions

- (IBAction)actionForChangeBackgroundColor:(id)sender {

    [self changeBackground];
}

- (IBAction)actionInfoLabel:(UISlider *)sender {
    self.infoLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
}

- (IBAction)actionEnable:(UISwitch *)sender {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents]; // ignore interactions with user
    
    // if you want not to load controller use dispatch_after. This helps when your method do much work and user watns to play a lot with switcher
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.redComponentsSlider.enabled = sender.isOn;
        self.greenComponentSlider.enabled = sender.isOn;
        self.blueComponentSlider.enabled = sender.isOn;
        self.infoSlider.enabled = sender.isOn;
        
        [[UIApplication sharedApplication] endIgnoringInteractionEvents]; // spop ignore interaction with user
    });
    
    
   
}
@end
