//
//  ViewController.h
//  ObjCUITableViewSearchDZ
//
//  Created by Eugene Mekhedov on 01.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)actionSortStudents:(UISegmentedControl *)sender;

@end

