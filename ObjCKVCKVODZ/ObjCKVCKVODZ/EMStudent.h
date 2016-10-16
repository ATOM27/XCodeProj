//
//  EMStudent.h
//  ObjCKVCKVODZ
//
//  Created by Eugene Mekhedov on 05.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSDate* dateOfBirth;
@property (assign, nonatomic) BOOL gender;
@property (weak, nonatomic) EMStudent* friend;

-(instancetype)initWithRandoom;

-(NSDate*) getRandomDateOfBirth;
-(NSString*) getRandoomFirstName;
-(NSString*) getRandoomLastName;
-(void) resetAllValuesWithIVar;

@end
