//
//  EMDatePickerViewController.m
//  ObjCUIPopoverControllerDZ
//
//  Created by Eugene Mekhedov on 20.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMDatePickerViewController.h"
#import "ViewController.h"

@interface EMDatePickerViewController ()

@end

@implementation EMDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionDateChanged:(UIDatePicker *)sender {
    
    NSDate* date = sender.date;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    if ([self.delegate isKindOfClass:[ViewController class]]){
        [(ViewController*)self.delegate setDate:[dateFormatter stringFromDate:date]];
    }
}

-(void)dealloc{
    NSLog(@"dealocated!");
}
@end
