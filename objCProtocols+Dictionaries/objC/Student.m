//
//  Student.m
//  objC
//
//  Created by Eugene Mekhedov on 03.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Student.h"

@implementation Student

-(NSString*) description{
    NSString* string = [NSString stringWithFormat:@"Name = %@, second name = %@. Introduction: \"%@\"", self.name, self.secondName, self.introduce];
    return string;
}

@end
