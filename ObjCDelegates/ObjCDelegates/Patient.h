//
//  Patient.h
//  ObjCDelegates
//
//  Created by Eugene Mekhedov on 05.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PatientDelegate;
@class Doctor;



@interface Patient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float temperature;
@property (assign, nonatomic) BOOL headache;
@property (assign, nonatomic) BOOL stomache;
//@property (weak, nonatomic) id <PatientDelegate> delegate;

- (void) feelWarse;
- (void) takePill;
- (void) makeShoot;
- (void) howAreYou: (void (^) (Patient*)) block;

@end

//@protocol PatientDelegate <NSObject>
//
//- (void) patientFeelsBad:(Patient*) patient;
//
//@end
