//
//  EMUser.h
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 17.12.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMUser : NSObject

@property(strong, nonatomic) NSString* ident;
@property(strong, nonatomic) NSString* firstName;
@property(strong, nonatomic) NSString* lastName;
@property(strong, nonatomic) NSURL* imageURL;
@property(strong, nonatomic, nullable) NSString* status;

-(id) initWithServerResponseFriend:(NSDictionary*) responseObject;
-(id) initWithServerResponseUser:(NSDictionary*) responseObject;

@end
