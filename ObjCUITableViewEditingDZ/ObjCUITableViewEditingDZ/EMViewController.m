//
//  EMViewController.m
//  ObjCUITableViewEditingDZ
//
//  Created by Eugene Mekhedov on 08.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMViewController.h"
#import "ClassForSection.h"

@interface EMViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray* sectionsOfArray;

@end

@implementation EMViewController

-(void)loadView{
    [super loadView];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.editing = TRUE;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sectionsOfArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < arc4random() % 6 + 5; i++){
        
        ClassForSection* cfs = [[ClassForSection alloc] init];
        NSMutableArray* mutArr = [[NSMutableArray alloc] init];
        
        for (NSInteger j = 0; j < arc4random()%10 + 10; j++){
            [mutArr addObject:[NSString stringWithFormat:@"%ld %ld", i, j]];
        }
        cfs.membersInSection = mutArr;
        [self.sectionsOfArray addObject:cfs];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Section #%ld", section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sectionsOfArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[[self.sectionsOfArray objectAtIndex:section] membersInSection] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ClassForSection* cfs = [self.sectionsOfArray objectAtIndex:indexPath.section];
    
    cell.textLabel.text = [cfs.membersInSection objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return TRUE;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    ClassForSection* sourceCFS = [self.sectionsOfArray objectAtIndex:sourceIndexPath.section];
    NSMutableArray* tempArray = [[NSMutableArray alloc] initWithArray:sourceCFS.membersInSection];
    
    if (sourceIndexPath.section == destinationIndexPath.section){
        [tempArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
        sourceCFS.membersInSection = tempArray;
    }else{
        
        NSString* object = [tempArray objectAtIndex:sourceIndexPath.row];
        
        [tempArray removeObject:object];
        sourceCFS.membersInSection = tempArray;
        
        ClassForSection* destinationCFS = [self.sectionsOfArray objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationCFS.membersInSection];
        [tempArray insertObject:object atIndex:destinationIndexPath.row];
        
        destinationCFS.membersInSection = tempArray;
    }
}

#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}
@end
