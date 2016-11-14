//
//  EMStudentViewController.m
//  ObjCCoreDataPart4-FRC
//
//  Created by Eugene Mekhedov on 14.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudentViewController.h"
#import "EMCourse+CoreDataProperties.h"
#import "EMStudent+CoreDataProperties.h"

@interface EMStudentViewController ()

@end

@implementation EMStudentViewController
@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSFetchedResultsController*)fetchedResultsController{
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"EMStudent" inManagedObjectContext:self.viewContext];
    
    [fetchRequest setEntity:description];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor* nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSSortDescriptor* lastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSSortDescriptor* scoreDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    [fetchRequest setSortDescriptors:@[nameDescriptor, lastNameDescriptor, scoreDescriptor]];
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"courses contains %@ AND university == %@", self.course, self.course.university];
    
    [fetchRequest setPredicate:predicate];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc]
                                                             initWithFetchRequest:fetchRequest
                                                             managedObjectContext:self.viewContext
                                                             sectionNameKeyPath:@"university.name" // sections
                                                             cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    
    NSError *error = nil;
    if (![aFetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
    _fetchedResultsController = aFetchedResultsController;
    return _fetchedResultsController;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    
    return [sectionInfo name];
}

#pragma mark - UITableViewDataSource

- (void)configureCell:(UITableViewCell *)cell  withIndexPath:(NSIndexPath*) indexPath{
    
    EMStudent* student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", student.score];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //EMCourse* course = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //EMStudentViewController* vc = [[EMStudentViewController alloc] init];
    
    //vc.course = course;
    
    //[self.navigationController pushViewController:vc animated:YES];
}

@end
