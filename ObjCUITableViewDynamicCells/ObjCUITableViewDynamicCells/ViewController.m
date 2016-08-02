//
//  ViewController.m
//  ObjCUITableViewDynamicCells
//
//  Created by Eugene Mekhedov on 31.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSLog(@"numberOfSectionsInTableView");
    
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"numberOfRowsInSection %ld", (long)section);
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSArray* fontNamesForFamilyName = [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:section]];
    
    return [fontNamesForFamilyName count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSArray* familyNames = [UIFont familyNames];
    return [familyNames objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"cellForRowAtIndexPath, {%ld, %ld}", (long)indexPath.section, (long)indexPath.row);
    
    static NSString* identifier = @"Cell";
    
    
    //------------------------------------------------------------------------------------------------
    // THIS IS RIGHT
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"cell created");
    }else{
        NSLog(@"cell reused");
    }
    //------------------------------------------------------------------------------------------------
    
    
    //UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]; // this is wrong way to use cells, the right one is to reuse cells with identifier
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSArray* fontNamesForFamilyName = [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indexPath.section]];
    
    UIFont* font = [UIFont fontWithName:[fontNamesForFamilyName objectAtIndex:indexPath.row] size:16];

    cell.textLabel.text = font.fontName;
    cell.textLabel.font = font;
    
    return cell;
}


@end
