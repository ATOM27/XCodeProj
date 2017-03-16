//
//  EMServerManager.h
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 13.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@class EMUser;

@interface EMServerManager : NSObject

@property (strong,nonatomic) AFHTTPSessionManager *manager;


@property(strong, nonatomic, readonly) EMUser* currentUser;

+(EMServerManager*) sharedManager;

-(void) getFriendsWithOffset:(NSInteger) offset
                       count:(NSInteger) count
                   onSiccess:(void(^)(NSArray* friends)) success
                   onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void) getCityWithID:(NSString*) uid onSiccess:(void(^)(NSString* city)) success
            onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void) getUserInfoWithID:(NSString*)uid
                onSuccess:(void(^)(EMUser *user)) success
                onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void) authorizedUser:(void(^)(EMUser* user)) completion;

-(void) getGroupWallWithGroupID:(NSString*) groupID
                     withOffset:(NSInteger) offset
                          count:(NSInteger) count
                      onSiccess:(void(^)(NSArray* posts)) success
                      onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void)postText:(NSString*)string
    onGroupWall:(NSString*) groupID
      onSiccess:(void(^)(id result)) success
      onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;
@end
