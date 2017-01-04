//
//  EMUser.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 17.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUser.h"

@implementation EMUser

-(id) initWithServerResponseFriend:(NSDictionary*) responseObject{
    self = [super init];
    if (self) {
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];
        self.ident = [responseObject objectForKey:@"user_id"];
        
        self.status = nil;
        
        NSString* URLString = [responseObject objectForKey:@"photo_50"];
        
        if (URLString){
            self.imageURL = [NSURL URLWithString:URLString];
        }

    }
    return self;
}

-(id) initWithServerResponseUser:(NSDictionary*) responseObject{
    self = [super init];
    if (self) {
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];
        self.ident = [responseObject objectForKey:@"uid"];
        
        self.status = [responseObject objectForKey:@"status"];
        self.cityID = [responseObject objectForKey:@"city"];
        NSInteger onl = [responseObject objectForKey:@"online"];
        
        if (onl == 1){
            self.online = YES;
        }else{
            self.online = NO;
        }
        
        NSString* URLString = [responseObject objectForKey:@"photo_100"];
        
        if (URLString){
            self.imageURL = [NSURL URLWithString:URLString];
        }
        
    }
    return self;
}

@end
