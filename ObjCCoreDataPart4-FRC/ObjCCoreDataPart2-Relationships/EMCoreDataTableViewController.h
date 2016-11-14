//
//  EMCoreDataTableViewController.h
//  ObjCCoreDataPart4-FRC
//
//  Created by Eugene Mekhedov on 12.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EMCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext* viewContext;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (void)configureCell:(UITableViewCell *)cell  withIndexPath:(NSIndexPath*) indexPath;

@end
