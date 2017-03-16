//
//  EMPost.h
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 16.03.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMPost : NSObject

@property(strong, nonatomic) NSString* text;

-(id) initWithServerResponse:(NSDictionary*) responseObject;

@end
