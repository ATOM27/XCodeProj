//
//  EMServerManager.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 13.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMServerManager.h"
#import "EMUser.h"

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
                  NSDictionary* cityInfo = [cityArray objectAtIndex:0];
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
@end
