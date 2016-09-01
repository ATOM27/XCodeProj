//
//  ViewController.m
//  ObjCUITableViewSearchDZ
//
//  Created by Eugene Mekhedov on 01.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMStudent.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray* students;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.students = [[NSArray alloc] init];
    NSMutableArray* tempStudentsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < arc4random() % 100 + 10; i++){
        [tempStudentsArray addObject:[EMStudent randomStudent]];
    }
    
    self.students = tempStudentsArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.students count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    EMStudent* currentStudent = [self.students objectAtIndex:indexPath.row];
    
    NSString* nameAndSurname = [NSString stringWithFormat:@"%@ %@", [currentStudent firstName],
                                                                    [currentStudent lastName]];
    
    cell.textLabel.text = nameAndSurname;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)[currentStudent birthDate] ];
    
    return cell;
}


#pragma mark - UITableViewDelegate



@end
