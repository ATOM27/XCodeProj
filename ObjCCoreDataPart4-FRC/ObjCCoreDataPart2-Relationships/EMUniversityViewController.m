//
//  EMUniversityViewController.m
//  ObjCCoreDataPart4-FRC
//
//  Created by Eugene Mekhedov on 12.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUniversityViewController.h"
#import "EMUniversity+CoreDataProperties.h"
#import "EMCourseViewController.h"
#import "EMDataManager.h"

@interface EMUniversityViewController ()


@end

@implementation EMUniversityViewController
@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Universities";
    
    UIBarButtonItem* barBItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(actionBegin:)];
    
    self.navigationItem.rightBarButtonItem = barBItem;
    
    
}
-(void)actionBegin:(id)sender{
    [self.viewContext save:nil];
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
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"EMUniversity" inManagedObjectContext:self.viewContext];
    
    [fetchRequest setEntity:description];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor* nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[nameDescriptor]];

    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc]
                                                             initWithFetchRequest:fetchRequest
                                                             managedObjectContext:self.viewContext
                                                             sectionNameKeyPath:nil//sections
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

#pragma mark - UITableViewDataSource

- (void)configureCell:(UITableViewCell *)cell  withIndexPath:(NSIndexPath*) indexPath{
    
    EMUniversity* university = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = university.name;
    cell.detailTextLabel.text = nil;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EMUniversity* university = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    EMCourseViewController* vc = [[EMCourseViewController alloc] init];
    
    vc.university = university;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
