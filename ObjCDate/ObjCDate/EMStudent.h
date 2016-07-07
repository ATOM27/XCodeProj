//
//  EMStudent.h
//  ObjCDate
//
//  Created by Eugene Mekhedov on 03.05.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EMStudent : NSObject

@property (strong, nonatomic) NSDate* dateOfBirth;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;

-(void) setNameAndSername:(NSInteger) randNameNumber surname:(NSInteger) randSurnameNumber;

@end
