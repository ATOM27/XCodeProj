//
//  ViewController.m
//  ObjCUITableViewDynamicCellsDZ
//
//  Created by Eugene Mekhedov on 02.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "Custom.h"
#import "Student.h"

@interface ViewController ()

@property (assign, nonatomic) CGFloat redComponent;
@property (assign, nonatomic) CGFloat greenComponent;
@property (assign, nonatomic) CGFloat blueComponent;

@property (strong, nonatomic) NSMutableArray* arrayOfStudents;

@property (strong, nonatomic) NSMutableArray* arrayOfCustoms;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.frame = CGRectMake(CGRectGetMinX(self.view.bounds),
                                      CGRectGetMinY(self.view.bounds) + 20,
                                      CGRectGetWidth(self.view.bounds),
                                      CGRectGetHeight(self.view.bounds) - 20);
    //self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    
//    self.arrayOfCustoms = [[NSMutableArray alloc] init];
//    
//    for (int i = 0; i < 1000; i++){
//        Custom* customMember = [[Custom alloc] initWithColor:[self randomColor]];
//        customMember.name = [NSString stringWithFormat:@"%d", i];
//        [self.arrayOfCustoms addObject:customMember];
//    }
    
    self.arrayOfStudents = [[NSMutableArray alloc] init];
    
    for (int i =0; i < 30; i++){
        Student* newStudent = [[Student alloc] initWithRandoom];
        [self.arrayOfStudents addObject:newStudent];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Color

-(UIColor*) randomColor {
    
    self.redComponent = drand48();
    self.greenComponent = drand48();
    self.blueComponent = drand48();
    
    return [UIColor colorWithRed:self.redComponent green:self.greenComponent blue:self.blueComponent alpha:1.f];
}

#pragma mark - Private methods

-(UIColor*) getColorDependOfAverageMarkOnStudent:(Student*) selectedStudent {
    
    UIColor* color = [UIColor redColor];
    if (selectedStudent.averageMark < 10 && selectedStudent.averageMark >= 6){
        color = [UIColor yellowColor];
    }
    if (selectedStudent.averageMark >= 10){
        color = [UIColor greenColor];
    }
    return color;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayOfStudents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.backgroundColor = [[self.arrayOfCustoms objectAtIndex:indexPath.row] color];
        NSLog(@"cell created");
    }else{
        cell.backgroundColor = [[self.arrayOfCustoms objectAtIndex:indexPath.row] color];
    }
    
    [self.arrayOfStudents sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([[obj1 name] compare:[obj2 name]] == NSOrderedSame){
            return [[obj1 secondName] compare:[obj2 secondName]];
        }else{
            return [[obj1 name] compare:[obj2 name]];
        }
    }];
    
    Student* selectedStudent = [self.arrayOfStudents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", selectedStudent.name, selectedStudent.secondName];
    cell.textLabel.textColor = [self getColorDependOfAverageMarkOnStudent:selectedStudent];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)selectedStudent.averageMark];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"RGB{%.2f, %.2f, %.2f}", self.redComponent, self.greenComponent, self.blueComponent];
    //cell.textLabel.text = [[self.arrayOfCustoms objectAtIndex:indexPath.row] name];
    //cell.textLabel.shadowColor = [UIColor whiteColor];
    //cell.textLabel.textAlignment = NSTextAlignmentCenter;
    //cell.textLabel.textColor = [UIColor colorWithRed:self.redComponent green:self.greenComponent blue:self.blueComponent alpha:1.f];
    return cell;
}

@end
