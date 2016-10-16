//
//  ViewController.m
//  ObjCKVCKVODZ
//
//  Created by Eugene Mekhedov on 05.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMStudent.h"
typedef NS_ENUM(NSInteger, EMGanderName){
    EMGanderNameMale,
    EMGanderNameFemale
};

@interface ViewController ()

@property (strong, nonatomic) EMStudent* student;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    EMStudent* student = [[EMStudent alloc] initWithRandoom];
    self.student = student;
    
    self.nameLabel.text = self.student.firstName;
    self.lastName.text = self.student.lastName;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/YYYY"];
    
    self.dateOfBirthDate.text = [dateFormatter stringFromDate:student.dateOfBirth];
    if (self.student.gender == EMGanderNameMale){
        self.genderLabel.text = @"Male";
    }else{
        self.genderLabel.text = @"Female";
    }
    
    [self.student addObserver:self
              forKeyPath:@"firstName"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    
    [self.student addObserver:self
              forKeyPath:@"lastName"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    
    [self.student addObserver:self
              forKeyPath:@"dateOfBirth"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    
    [self.student addObserver:self
              forKeyPath:@"gender"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                 context:nil];
    
    
}

-(void)dealloc{
    [self.student removeObserver:self forKeyPath:@"firstName"];
    [self.student removeObserver:self forKeyPath:@"lastName"];
    [self.student removeObserver:self forKeyPath:@"dateOfBirth"];
    [self.student removeObserver:self forKeyPath:@"gender"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Observing

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@\n", keyPath, object, change);
    
    
}

#pragma mark - UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([[[self.tableView cellForRowAtIndexPath:indexPath] reuseIdentifier] isEqualToString:@"changeCell"]){
        
        self.student.firstName = [self.student getRandoomFirstName];
        self.student.lastName = [self.student getRandoomLastName];
        self.student.dateOfBirth = [self.student getRandomDateOfBirth];
        self.student.gender = arc4random()%2;
        
        self.nameLabel.text = self.student.firstName;
        self.lastName.text = self.student.lastName;
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/YYYY"];
        
        self.dateOfBirthDate.text = [dateFormatter stringFromDate:self.student.dateOfBirth];
        
        if (self.student.gender == EMGanderNameMale){
            self.genderLabel.text = @"Male";
        }else{
            self.genderLabel.text = @"Female";
        }
        
    }
}

#pragma mark - Actions

- (IBAction)actionReset:(id)sender {
    [self.student resetAllValuesWithIVar];
}
@end
