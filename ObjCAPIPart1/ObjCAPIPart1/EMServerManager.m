//
//  EMServerManager.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 13.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMServerManager.h"
#import "EMUser.h"
#import "EMLoginViewController.h"
#import "EMAccessToken.h"
#import "EMPost.h"

@interface EMServerManager ()

@property (strong, nonatomic) EMAccessToken* accessToken;

@end

@implementation EMServerManager

+(EMServerManager*) sharedManager{
    
    static EMServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[EMServerManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL* url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    return self;
}

-(void) getFriendsWithOffset:(NSInteger) offset
                       count:(NSInteger) count
                   onSiccess:(void(^)(NSArray* friends)) success
                   onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure{
    

    
    NSString *URLString = @"friends.get";
    NSDictionary *parameters = @{@"user_id":    @"76240030",
                                 @"order": @"name",
                                 @"count":@(count),
                                 @"offset":@(offset),
                                 @"fields":@[@"photo_50"],
                                 @"name_case": @"nom"};
    
    [self.manager GET:URLString
           parameters:parameters
             progress:nil
              success:^(NSURLSessionTask *task, id responseObject) {
       // NSLog(@"JSON: %@", responseObject);
                  
                  NSArray* friendsArray = [responseObject objectForKey:@"response"];
                  
                  NSMutableArray* objectsArray = [NSMutableArray array];
                  
                  for (NSDictionary* dict in friendsArray){
                      
                      EMUser* user = [[EMUser alloc] initWithServerResponseFriend:dict];
                      [objectsArray addObject:user];
                  }
                  
                  
                  if (success){ // if success block is send and it is OK than...
                      success(objectsArray);
                  }
                  
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        if(failure){
            
            NSHTTPURLResponse* r = (NSHTTPURLResponse*)operation.response;
            failure(error, r.statusCode);
            
        }
    }];
}

-(void) getUserInfoWithID:(NSString*)uid
                onSuccess:(void(^)(EMUser* user)) success
                onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure{
    
    NSString *URLString = @"users.get";
    NSDictionary *parameters = @{@"user_ids":uid,
                                 @"fields":@[@"photo_100",@"status",@"city",@"online"],
                                 @"name_case": @"nom"};
    
    [self.manager GET:URLString
           parameters:parameters
             progress:nil
              success:^(NSURLSessionTask *task, id responseObject) {
                  
                  NSArray* userArray = [responseObject objectForKey:@"response"];
                  NSDictionary* userInfo = [userArray objectAtIndex:0];
                  EMUser* user = [[EMUser alloc] initWithServerResponseUser:userInfo];
                  
                  if(success){
                      success(user);
                  }
              }
              failure:^(NSURLSessionTask *operation, NSError *error){
                  
                  if(failure){
                      
                      NSHTTPURLResponse* r = (NSHTTPURLResponse*)operation.response;
                      failure(error, r.statusCode);
                  }
              }];
}

-(void) getCityWithID:(NSString*) uid onSiccess:(void(^)(NSString* city)) success
            onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure{
    
    NSString *URLString = @"database.getCitiesById";
    NSDictionary* paramethers = @{@"city_ids":@[uid]};
    
    [self.manager GET:URLString
           parameters:paramethers
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  
                  NSArray* cityArray = [responseObject objectForKey:@"response"];
                  NSDictionary* cityInfo = [cityArray firstObject];
                  NSString* city = [cityInfo objectForKey:@"name"];
                  
                  if(success){
                      success(city);
                  }
                  
              } failure:^(NSURLSessionTask *operation, NSError *error){
                  
                  if(failure){
                      
                      NSHTTPURLResponse* r = (NSHTTPURLResponse*)operation.response;
                      failure(error, r.statusCode);
                  }
              }];
    
    
}

-(void) authorizedUser:(void(^)(EMUser* user)) completion{
    
    EMLoginViewController* vc = [[EMLoginViewController alloc] initWithCompletionBlock:^(EMAccessToken *token) {
        
        self.accessToken = token;
        
        if (completion){
            completion(nil );
        }
    }];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    UIViewController* mainVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    [mainVC presentViewController:nav animated:YES completion:nil];
    
}

-(void) getGroupWallWithGroupID:(NSString*) groupID
          withOffset:(NSInteger) offset
               count:(NSInteger) count
           onSiccess:(void(^)(NSArray* posts)) success
           onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure{
    
    NSString *URLString = @"wall.get";
    NSDictionary *parameters = @{@"owner_id": [NSString stringWithFormat:@"-%@", groupID],
                                 @"count":@(count),
                                 @"offset":@(offset),
                                 @"filter":@"all"};
    
    [self.manager GET:URLString
           parameters:parameters
             progress:nil
              success:^(NSURLSessionTask *task, id responseObject) {
                  // NSLog(@"JSON: %@", responseObject);
                  
                  NSArray* postsArray = [responseObject objectForKey:@"response"];
                  
                  if([postsArray count] > 1){
                      postsArray = [postsArray subarrayWithRange:NSMakeRange(1, (int)[postsArray count] -1)];
                  }else{
                      postsArray = nil;
                  }
                  
                  NSMutableArray* objectsArray = [NSMutableArray array];
                  
                  for (NSDictionary* dict in postsArray){
                      
                      EMPost* post = [[EMPost alloc] initWithServerResponse:dict];
                      [objectsArray addObject:post];
                  }
                  
                  
                  if (success){ // if success block is send and it is OK than...
                      success(objectsArray);
                  }
                  
              } failure:^(NSURLSessionTask *operation, NSError *error) {
                  NSLog(@"Error: %@", error);
                  
                  if(failure){
                      
                      NSHTTPURLResponse* r = (NSHTTPURLResponse*)operation.response;
                      failure(error, r.statusCode);
                      
                  }
              }];
}

-(void)postText:(NSString*)text
    onGroupWall:(NSString*) groupID
      onSiccess:(void(^)(id result)) success
      onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure{
    
    NSString *URLString = @"wall.post";
    NSDictionary *parameters = @{@"owner_id": [NSString stringWithFormat:@"-%@", groupID],
                                 @"message":text,
                                 @"access_token":self.accessToken.token
                                 };
    
    [self.manager POST:URLString
           parameters:parameters
             progress:nil
              success:^(NSURLSessionTask *task, id responseObject) {
                  
                  if (success){ // if success block is send and it is OK than...
                      success(responseObject);
                  }
                  
              } failure:^(NSURLSessionTask *operation, NSError *error) {
                  NSLog(@"Error: %@", error);
                  
                  if(failure){
                      
                      NSHTTPURLResponse* r = (NSHTTPURLResponse*)operation.response;
                      failure(error, r.statusCode);
                      
                  }
              }];

}

@end
