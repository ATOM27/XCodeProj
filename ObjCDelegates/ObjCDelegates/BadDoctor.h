//
//  BadDoctor.h
//  ObjCDelegates
//
//  Created by Eugene Mekhedov on 06.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface BadDoctor : NSObject
//<PatientDelegate>

- (void) eatFrog: (Patient*) patient;
- (void) makeBadShoot: (Patient*) patient;
- (void) wrongDiagnosis: (Patient*) patient;

@end
