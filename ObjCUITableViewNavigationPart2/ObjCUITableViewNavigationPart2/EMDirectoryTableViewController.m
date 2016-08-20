//
//  EMDirectoryTableViewController.m
//  ObjCUITableViewNavigationPart2
//
//  Created by Eugene Mekhedov on 21.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMDirectoryTableViewController.h"

@interface EMDirectoryTableViewController ()

@property (strong, nonatomic) NSString* path;
@property (strong, nonatomic) NSArray* contents;

@end

@implementation EMDirectoryTableViewController

-(void) setPath:(NSString *)path{
    _path = path;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contents count];
}

@end
