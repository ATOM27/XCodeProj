//
//  EMUser.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 17.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMUser.h"

@implementation EMUser

-(id) initWithServerResponse:(NSDictionary*) responseObject;

{
    self = [super init];
    if (self) {
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];
        
        NSString* URLString = [responseObject objectForKey:@"photo_50"];
        
        if (URLString){
            self.imageURL = [NSURL URLWithString:URLString];
        }

    }
    return self;
}

@end
