//
//  EMViewController.m
//  ObjCUITableViewEditingPart1
//
//  Created by Eugene Mekhedov on 07.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMViewController.h"
#import "EMStudent.h"
#import "EMGroup.h"

@interface EMViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSMutableArray* groupsArray;

@end

@implementation EMViewController

-(void)loadView{
    
    [super loadView];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.groupsArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < (arc4random() % 6 + 5); i++){
        
        EMGroup* group = [[EMGroup alloc] init];
        group.name = [NSString stringWithFormat:@"Group #%ld", i];
        
        NSMutableArray* array = [NSMutableArray array];
        
        for (NSInteger j = 0; j < (arc4random() % 11 + 15); j++){
            [array addObject:[EMStudent randomStudent]];
        }
        
        group.studentsArray = array;
        
        [self.groupsArray addObject:group];
    }
    
    [self.tableView reloadData];
    
    self.navigationItem.title = @"Students";
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                target:self
                                                                                action:@selector(actionAddSection:)];
    
    self.navigationItem.leftBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(void) actionEdit:(UIBarButtonItem*) sender {
    
    BOOL isEditing = self.tableView.editing;
    
    [self.tableView setEditing:!isEditing animated:TRUE];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemDone;
    
    if (isEditing){
        item = UIBarButtonSystemItemEdit;
    }
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    
    [self.navigationItem setRightBarButtonItem:editButton animated:TRUE];
}

-(void) actionAddSection:(UIBarButtonItem*) sender {
    
    EMGroup* group = [[EMGroup alloc] init];
    group.name = [NSString stringWithFormat:@"Group #%ld", ([self.groupsArray count]+1)];
    group.studentsArray = @[[EMStudent randomStudent], [EMStudent randomStudent]];
    
    NSInteger newSectionIndex = 0;
    [self.groupsArray insertObject:group atIndex:newSectionIndex];
    
    [self.tableView beginUpdates];
    
    
        NSIndexSet* insertSection = [NSIndexSet indexSetWithIndex:newSectionIndex];
    
        [self.tableView insertSections:insertSection withRowAnimation:[self.groupsArray count] % 2 ? UITableViewRowAnimationRight : UITableViewRowAnimationLeft];
    
    
    [self.tableView endUpdates];
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]){
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });
}

#pragma mark - UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [[self.groupsArray objectAtIndex:section] name];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.groupsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[self.groupsArray objectAtIndex: section] studentsArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    EMGroup* group = [self.groupsArray objectAtIndex:indexPath.section];
    EMStudent* student = [group.studentsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName] ;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", student.averageGrade];
    
    if (student.averageGrade >= 4.0){
        cell.detailTextLabel.textColor = [UIColor greenColor];
    }else if (student.averageGrade >=3.0){
        cell.detailTextLabel.textColor = [UIColor orangeColor];
    }else if (student.averageGrade < 3.0){
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EMGroup* sourceGroup = [self.groupsArray objectAtIndex:indexPath.section];
    EMStudent* student = [sourceGroup.studentsArray objectAtIndex:indexPath.row];
    
    return student.averageGrade < 4.0;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    EMGroup* sourceGroup = [self.groupsArray objectAtIndex:sourceIndexPath.section];
    EMStudent* student = [sourceGroup.studentsArray objectAtIndex:sourceIndexPath.row];
    
    NSMutableArray* tempArray = [[NSMutableArray alloc] initWithArray:sourceGroup.studentsArray];
    
    if (sourceIndexPath.section == destinationIndexPath.section){
        
        [tempArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
        sourceGroup.studentsArray = tempArray;
    }else{
    
        [tempArray removeObject:student];
        
        sourceGroup.studentsArray = tempArray;
        
        EMGroup* destinationGroup = [self.groupsArray objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationGroup.studentsArray];
        [tempArray insertObject:student atIndex:destinationIndexPath.row];
        
        destinationGroup.studentsArray = tempArray;
    }
}

#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return FALSE;
}

@end
