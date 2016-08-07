//
//  EMStudent.h
//  ObjCUITableViewEditingPart1
//
//  Created by Eugene Mekhedov on 07.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface EMStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) CGFloat averageGrade;

+ (EMStudent*) randomStudent;

@end
