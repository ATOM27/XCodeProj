//
//  EMDirectoryTableViewController.m
//  ObjCUITableViewNavigationPart1
//
//  Created by Eugene Mekhedov on 19.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMDirectoryTableViewController.h"

@interface EMDirectoryTableViewController ()

@property (strong, nonatomic) NSString* path;
@property (strong, nonatomic) NSArray* contents;

@end

@implementation EMDirectoryTableViewController

-(id) initWithFolderPath:(NSString*) path{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.path = path;
        
        NSError* error = nil;
        
        self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path
                                                                            error:&error];
        
        if (error){
            NSLog(@"%@", [error localizedDescription]);
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [self.path lastPathComponent];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.contents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    BOOL isDirectory = NO;
    
    NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    if (isDirectory){
        
    }
    
    cell.textLabel.text = fileName;
    
    return cell;
}

@end
