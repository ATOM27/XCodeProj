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
@property (strong, nonatomic) NSArray* sectionsArray;
@property (strong, nonatomic) NSOperation* currentOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    self.sectionsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 100000; i++){
        [array addObject:[[NSString randomAlphanumericString] capitalizedString]];
    }
    
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES];
    
    [array sortUsingDescriptors:@[sortDescriptor]];
    
    self.namesArray = array;
    //self.sectionsArray = [self generateSectionsFromArray:self.namesArray withFilter:self.searchBar.text];
    //[self.tableView reloadData];
    
    [self generateSectionsInBackGroundFromArray:self.namesArray withFilter:self.searchBar.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

-(void) generateSectionsInBackGroundFromArray:(NSArray*) array withFilter:(NSString*) filterString{
    
    [self.currentOperation cancel]; // if this method called the previous operation canceled
    
    __weak ViewController* weakSelf = self;
    
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        NSArray* sectionsArray = [weakSelf generateSectionsFromArray:array withFilter:filterString];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            weakSelf.sectionsArray = sectionsArray;
            [weakSelf.tableView reloadData]; // reloadData need to use only in main queue
            
            self.currentOperation = nil;
        });
    }];
    
    [self.currentOperation start];
}

-(NSArray*) generateSectionsFromArray:(NSArray*) array withFilter:(NSString*) filterString{
    
    NSMutableArray* sectionsArray = [[NSMutableArray alloc] init];
    NSString* currentLatter = nil;
    
    for (NSString* string in array){
        
        if ([filterString length] > 0 && [string rangeOfString:filterString].location == NSNotFound){
            continue; 
        }
        
        NSString* firstLetter = [string substringToIndex:1];
        
        EMSection* section = nil;
        
        if (![currentLatter isEqualToString:firstLetter]){
            
            section = [[EMSection alloc] init];
            section.sectionName = firstLetter;
            section.itemsArray = [[NSMutableArray alloc] init];
            currentLatter = firstLetter;
            
            [sectionsArray addObject:section];
            
        }else{
            section = [sectionsArray lastObject];
        }
        
        [section.itemsArray addObject:string];
    }
    
    return sectionsArray;

}

#pragma mark - UITableViewDataSource
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for (EMSection* section in self.sectionsArray){
        [array addObject:section.sectionName];
    }
    
    return array;
}

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

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    NSLog(@"Text did change: %@", self.searchBar.text);
    
    //self.sectionsArray = [self generateSectionsFromArray:self.namesArray withFilter:searchText];
    //[self.tableView reloadData];
    [self generateSectionsInBackGroundFromArray:self.namesArray withFilter:searchText];
}
@end
