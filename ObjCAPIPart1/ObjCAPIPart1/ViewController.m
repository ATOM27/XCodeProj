//
//  ViewController.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 13.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import "EMServerManager.h"
#import "EMUser.h"
#import "UIImageView+AFNetworking.h"
#import "EMFriendInfoTableViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* friendsArray;
@property (strong, nonatomic) EMUser* selectedUser;

@end

@implementation ViewController

static NSInteger friendsInRequest = 20;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.friendsArray = [[NSMutableArray alloc] init];
    
    //[self getFriendsFromServer];
    
    [[EMServerManager sharedManager] authorizedUser:^(EMUser *user) {
        NSLog(@"TADA!");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API

-(void) getFriendsFromServer{
    
    [[EMServerManager sharedManager] getFriendsWithOffset: [self.friendsArray count]
                                                    count:friendsInRequest
                                                onSiccess:^(NSArray *friends) {
                                                    
                                                    [self.friendsArray addObjectsFromArray:friends];
                                                    
                                                    NSMutableArray* newPaths = [NSMutableArray array];
                                                    
                                                    for(int i = (int)[self.friendsArray count] - (int)[friends count]; i < [self.friendsArray count]; i++){
                                                        [newPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
                                                    }
                                                    
                                                    [self.tableView beginUpdates];
                                                        [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationTop];
                                                    [self.tableView endUpdates];
                                                    
                                                }
                                                onFailure:^(NSError *error, NSInteger statusCode) {
                                                    NSLog(@"Error =%@ code = %ld",[error localizedDescription], (long)statusCode);
                                                }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.friendsArray count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == [self.friendsArray count]){
        
        [cell setValue:@"LoadCell" forKey:@"reuseIdentifier"];
        cell.textLabel.text = @"LOAD MORE";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor blueColor];
        cell.imageView.image = nil;
        cell.accessoryType = UITableViewCellAccessoryNone;

    
    }else{
        
        EMUser* friend = [self.friendsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", friend.firstName, friend.lastName];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        NSURLRequest* request = [NSURLRequest requestWithURL:friend.imageURL];
        
        __weak UITableViewCell* weakCell = cell;
        
        [cell.imageView setImageWithURLRequest:request
                              placeholderImage:nil
                                       success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                           
                                           weakCell.imageView.image = image;
                                           [weakCell layoutSubviews];
                                           
                                       } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                       }];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == [self.friendsArray count]){
        
        [self getFriendsFromServer];
        
    }else{
        self.selectedUser = [self.friendsArray objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"FriendInfoIdentifier" sender:nil];
    }
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [[EMServerManager sharedManager] getUserInfoWithID:self.selectedUser.ident
                                             onSuccess:^(EMUser *user) {
                                                 
                                                 EMFriendInfoTableViewController* vc = segue.destinationViewController;
                                                 [vc setUser:user];
                                                 
                                             } onFailure:^(NSError *error, NSInteger statusCode) {
                                                 NSLog(@"Error =%@ code = %ld",[error localizedDescription], (long)statusCode);
                                             }];
}


@end
