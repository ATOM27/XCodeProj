//
//  ViewController.m
//  ObjCUITableViewSearchDZ
//
//  Created by Eugene Mekhedov on 01.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMStudent.h"
#import "EMSections.h"

typedef NS_ENUM(NSInteger, EMSortType){
    EMSortTypeBirthDate,
    EMSortTypeName,
    EMSortTypeSecondName
};

@interface ViewController ()

@property (strong, nonatomic) NSArray* students;
@property (strong, nonatomic) NSMutableArray* sections;
@property (strong, nonatomic) NSOperation* currentOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.students = [[NSArray alloc] init];
    NSMutableArray* tempStudentsArray = [[NSMutableArray alloc] init];
    self.sections = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < arc4random() % 1000 + 10; i++){
        [tempStudentsArray addObject:[EMStudent randomStudent]];
    }
    
    self.students = tempStudentsArray;
    
    self.students = [self sortStudentsOnDate:self.students];
    
    [self generateSectionsFromArrayInBackgroundWithDate:self.students withFilter:self.searchBar.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
-(void) generateSectionsFromArrayInBackground:(NSArray*) students withFilter:(NSString*) filterString{
    
    [self.currentOperation cancel];
    
    __weak ViewController* weakSelf = self;
    
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{

        weakSelf.sections = [weakSelf generateSectionsFromArrayWithDate:students withFilter:filterString]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakSelf.tableView reloadData];
            weakSelf.currentOperation = nil;
        });
        
    }];
    
    [self.currentOperation start];
    
}


-(void) generateSectionsFromArrayInBackgroundWithName:(NSArray*) students withFilter:(NSString*) filterString{
    
    [self.currentOperation cancel];
    
    __weak ViewController* weakSelf = self;
    
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        weakSelf.sections = [weakSelf ];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakSelf.tableView reloadData];
            weakSelf.currentOperation = nil;
        });
        
    }];
    
    [self.currentOperation start];
    
}

-(void) generateSectionsFromArrayInBackgroundWithDate:(NSArray*) students withFilter:(NSString*) filterString{
    
    [self.currentOperation cancel];
    
    __weak ViewController* weakSelf = self;
    
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{
        
       weakSelf.sections = [weakSelf generateSectionsFromArrayWithDate:students withFilter:filterString];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakSelf.tableView reloadData];
            weakSelf.currentOperation = nil;
        });
        
    }];
    
    [self.currentOperation start];
}

-(NSMutableArray*) generateSectionsFromArrayWithDate:(NSArray*) students withFilter:(NSString*) filterString{
    
    NSString* currentMonth = nil;
    NSMutableArray* sectionsArray = [[NSMutableArray alloc] init];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM"];
    
    for (EMStudent* student in students){
        
        if (filterString.length > 0 && ([student.firstName rangeOfString:filterString].location == NSNotFound && [student.lastName rangeOfString:filterString].location == NSNotFound)){
            continue;
        }
        
        NSString* studentMonthString = [dateFormatter stringFromDate:student.birthDate];
        EMSections* section = nil;
        
        if (![studentMonthString isEqualToString:currentMonth]){
            
            section = [[EMSections alloc] init];
            section.sectionName = studentMonthString;
            section.studentsInSection = [[NSMutableArray alloc] init];
            currentMonth = studentMonthString;
            [sectionsArray addObject:section];
            
        }else{
            section = [sectionsArray lastObject];
        }
        
        [section.studentsInSection addObject:student];
    }
    
    for (EMSections* sec in sectionsArray){
        
        NSSortDescriptor* nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
        NSSortDescriptor* lastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
        
        sec.studentsInSection = [sec.studentsInSection sortedArrayUsingDescriptors:@[nameDescriptor, lastNameDescriptor]];
    }
    return sectionsArray;
}

-(NSArray*) sortStudentsOnDate:(NSArray*) students{
   students = [students sortedArrayUsingComparator:^NSComparisonResult(EMStudent*  _Nonnull obj1, EMStudent*  _Nonnull obj2) {
        
        NSCalendar* calendar = [NSCalendar currentCalendar];
        
        NSDateComponents* componentsObj1 = [calendar components:NSCalendarUnitMonth fromDate:obj1.birthDate];
        NSDateComponents* componentsObj2 = [calendar components:NSCalendarUnitMonth fromDate:obj2.birthDate];
        
        if (componentsObj1.month > componentsObj2.month){
            return NSOrderedDescending;
        }else{
            return NSOrderedAscending;
        }
    }];
    
    return students;

}

-(void) sortWithSelectedSegmentedControl:(UISegmentedControl*) segmentedControl{
    
    switch (sender.selectedSegmentIndex) {
        case EMSortTypeBirthDate:
            
            [self generateSectionsFromArrayInBackgroundWithDate:self.students withFilter:self.searchBar.text];
            [self.tableView reloadData];
            
            break;
            
        case EMSortTypeName:
            
            break;
            
        case EMSortTypeSecondName:
            <#statements#>
            break;
    }

}

#pragma mark - UITableViewDataSource
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.sections objectAtIndex:section] sectionName];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[self.sections objectAtIndex:section] studentsInSection] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    EMStudent* currentStudent = [[[self.sections objectAtIndex:indexPath.section] studentsInSection] objectAtIndex:indexPath.row];
    
    NSString* nameAndSurname = [NSString stringWithFormat:@"%@ %@", [currentStudent firstName],
                                                                    [currentStudent lastName]];
    
    cell.textLabel.text = nameAndSurname;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d MMM YYYY"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:[currentStudent birthDate]]];
    
    return cell;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    NSMutableArray* sectionTitles = [[NSMutableArray alloc] init];
    
    for (EMSections* sec in self.sections){
        [sectionTitles addObject:sec.sectionName];
    }
    
    return sectionTitles;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self sortWithSelectedSegmentedControl:self.segmentedControl];
}



#pragma mark - Actions

- (IBAction)actionSortStudents:(UISegmentedControl *)sender {
    [self sortWithSelectedSegmentedControl:sender];
}
@end
