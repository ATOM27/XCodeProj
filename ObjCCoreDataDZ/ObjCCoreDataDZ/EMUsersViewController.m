//
//  EMUsersViewController.m
//  ObjCCoreDataDZ
//
//  Created by Eugene Mekhedov on 22.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUsersViewController.h"
#import "EMUsers+CoreDataProperties.h"
#import "EMDataManager.h"
#import "EMAddUserTableViewController.h"
#import "EMUpdateTableViewController.h"

typedef NS_ENUM(NSInteger, EMTextFieldType){
    EMTextFieldTypeName,
    EMTextFieldTypeLastName,
    EMTextFieldTypeEmail
};

@interface EMUsersViewController ()

@end

@implementation EMUsersViewController
@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Users";
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
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"EMUsers" inManagedObjectContext:self.viewContext];
    
    [fetchRequest setEntity:description];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor* firstNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSSortDescriptor* lastNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[firstNameDescriptor, lastNameDescriptor]];
    
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
    
    EMUsers* user = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    cell.detailTextLabel.text = user.email;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EMUpdateTableViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EMUpdateTableViewController"];
    
    EMUsers* user = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    vc.firstNameString = user.firstName;
    vc.lastNameString = user.lastName;
    vc.emailString = user.email;
    vc.user = user;
    
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

@end
