//
//  EMPost.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 16.03.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

#import "EMPost.h"

@implementation EMPost

-(id) initWithServerResponse:(NSDictionary*) responseObject{
    self = [super init];
    if (self) {
        
        self.text = [responseObject objectForKey:@"text"];
        self.text = [self.text stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    
    }
    return self;
}


@end
