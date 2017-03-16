//
//  EMGroupWallViewCantroller.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 16.03.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

#import "EMGroupWallViewCantroller.h"
#import "EMServerManager.h"
#import "EMPostCell.h"

#import "EMUser.h"
#import "EMPost.h"

@interface EMGroupWallViewCantroller ()

@property (strong, nonatomic) NSMutableArray* postsArray;

@end

static NSInteger postsInRequest = 20;

@implementation EMGroupWallViewCantroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postsArray = [[NSMutableArray alloc] init];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [[EMServerManager sharedManager] authorizedUser:^(EMUser *user) {
        NSLog(@"TADA!");
    }];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
    
    UIRefreshControl* refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(refreshWall) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API
- (IBAction)postOnWall:(id)sender {
    [[EMServerManager sharedManager] postText:@"Это тест из урока 47!"
                                  onGroupWall:@"58860049"
                                    onSiccess:^(id result) {
                                        
                                    } onFailure:^(NSError *error, NSInteger statusCode) {
                                        
                                    }];
}


-(void) refreshWall{
    
    [[EMServerManager sharedManager] getGroupWallWithGroupID:@"58860049"
                                                  withOffset:0
                                                       count:postsInRequest
                                                   onSiccess:^(NSArray *posts) {
                                                       
                                                       [self.postsArray removeAllObjects];
                                                       
                                                       [self.postsArray addObjectsFromArray:posts];
                                                       
                                                       [self.tableView reloadData];
                                                       
                                                       [self.refreshControl endRefreshing];
                                                   } onFailure:^(NSError *error, NSInteger statusCode) {
                                                       NSLog(@"Error =%@ code = %ld",[error localizedDescription], (long)statusCode);
                                                       [self.refreshControl endRefreshing];
                                                   }];

}

-(void) getPostsFromServer{
    [[EMServerManager sharedManager] getGroupWallWithGroupID:@"58860049"
                                                  withOffset:[self.postsArray count]
                                                       count:postsInRequest
                                                   onSiccess:^(NSArray *posts) {
                                                       
                                                       [self.postsArray addObjectsFromArray:posts];
                                                       
                                                       //NSMutableArray* newPaths = [NSMutableArray array];
                                                       
//                                                       for(int i = (int)[self.postsArray count] - (int)[posts count]; i < [self.postsArray count]; i++){
//                                                           [newPaths addObject:[NSIndexPath indexPathForRow:0 inSection:i ]];
//                                                       }
                                                       
                                                       [self.tableView beginUpdates];
                                                       
                                                       [self.tableView insertSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange((int)[self.postsArray count] - (int)[posts count], [posts count])]
                                                                     withRowAnimation:UITableViewRowAnimationTop];
                                                      // [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationTop];
                                                       [self.tableView endUpdates];
                                                       
                                                   } onFailure:^(NSError *error, NSInteger statusCode) {
                                                       NSLog(@"Error =%@ code = %ld",[error localizedDescription], (long)statusCode);
                                                   }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return [self.postsArray count]+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == [self.postsArray count]){
        
        static NSString* identifier = @"Cell";
        UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }

        
        [cell setValue:@"LoadCell" forKey:@"reuseIdentifier"];
        cell.textLabel.text = @"LOAD MORE";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor blueColor];
        cell.imageView.image = nil;
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        return cell;

    }else{
        
        EMPost* post = [self.postsArray objectAtIndex:indexPath.section];
        
        static NSString* identifier = @"postCell";
        
        EMPostCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        
        cell.postTextLabel.text = post.text;
        return cell;

    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == [self.postsArray count]){
        [self getPostsFromServer];
    }
}

@end
