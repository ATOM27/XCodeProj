//
//  Student.h
//  objC
//
//  Created by Eugene Mekhedov on 03.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* secondName;
@property (strong, nonatomic) NSString* introduce;

-(NSString*) description;

@end
