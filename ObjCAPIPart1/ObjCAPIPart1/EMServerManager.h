//
//  EMServerManager.h
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 13.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "EMUser.h"
@interface EMServerManager : NSObject

@property (strong,nonatomic) AFHTTPSessionManager *manager;

+(EMServerManager*) sharedManager;

-(void) getFriendsWithOffset:(NSInteger) offset
                       count:(NSInteger) count
                   onSiccess:(void(^)(NSArray* friends)) success
                   onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

-(void) getUserInfoWithID:(NSString*)uid
                onSuccess:(void(^)(EMUser* user)) success
                onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

@end
