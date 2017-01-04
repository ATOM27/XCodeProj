//
//  EMFriendInfoTableViewController.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 18.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMFriendInfoTableViewController.h"
#import "UIImageView+AFNetworking.h"
#import "EMServerManager.h"

@interface EMFriendInfoTableViewController ()

@end

@implementation EMFriendInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


-(void)setUser:(EMUser *)user{
    _user = user;
    
    self.initialsLabel.text = [NSString stringWithFormat:@"%@ %@", self.user.firstName, self.user.lastName];
    self.statusLabel.text = self.user.status;
    [self.statusLabel sizeToFit];
    
    if (self.user.online){
        self.onlineLabel.text = @"Online";
    }else{
        self.onlineLabel.text = @"Offline";
    }
    
    [[EMServerManager sharedManager] getCityWithID:user.cityID
                                         onSiccess:^(NSString *city) {
                                             self.cityLabel.text = city;
                                             
                                         } onFailure:^(NSError *error, NSInteger statusCode) {
                                             NSLog(@"Error =%@ code = %ld",[error localizedDescription], (long)statusCode);
                                         }];

    
    NSURLRequest* request = [NSURLRequest requestWithURL:self.user.imageURL];
    
    __weak EMFriendInfoTableViewController *weakSelf = self;
    
    [self.avatarImage setImageWithURLRequest:request
                            placeholderImage:nil
                                     success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                         
                                         weakSelf.avatarImage.image = image;
                                         
                                     } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                     }];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
