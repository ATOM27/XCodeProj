//
//  EMStudent.h
//  ObjCUITableViewSearchDZ
//
//  Created by Eugene Mekhedov on 01.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSDate* birthDate;

+ (EMStudent*) randomStudent;

@end
