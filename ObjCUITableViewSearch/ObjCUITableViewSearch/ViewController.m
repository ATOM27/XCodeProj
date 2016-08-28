//
//  ViewController.m
//  ObjCUITableViewSearch
//
//  Created by Eugene Mekhedov on 29.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Random.h"
#import "EMSection.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray* namesArray;
@property (strong, nonatomic) NSMutableArray* sectionsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    self.sectionsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 100; i++){
        [array addObject:[[NSString randomAlphanumericString] capitalizedString]];
    }
    
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES];
    
    [array sortUsingDescriptors:@[sortDescriptor]];
    
    self.namesArray = array;
    
    NSString* currentLatter = nil;
    
    for (NSString* string in self.namesArray){
        
        NSString* firstLetter = [string substringToIndex:1];
        
        EMSection* section = nil;
        
        if (![currentLatter isEqualToString:firstLetter]){
            
            section = [[EMSection alloc] init];
            section.sectionName = firstLetter;
            section.itemsArray = [[NSMutableArray alloc] init];
            currentLatter = firstLetter;
            
            [self.sectionsArray addObject:section];
            
        }else{
            section = [self.sectionsArray lastObject];
        }
        
        [section.itemsArray addObject:string];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sectionsArray count];

}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.sectionsArray objectAtIndex:section] sectionName];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[self.sectionsArray objectAtIndex:section] itemsArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    EMSection* sec = [self.sectionsArray objectAtIndex:indexPath.section];
    
    cell.textLabel.text = [sec.itemsArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end
