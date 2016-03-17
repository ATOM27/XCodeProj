//
//  BadDoctor.m
//  ObjCDelegates
//
//  Created by Eugene Mekhedov on 06.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "BadDoctor.h"

@implementation BadDoctor

- (void) patientFeelsBad:(Patient *)patient{
    if (patient.headache && patient.stomache){
        [self makeBadShoot:patient];
        patient.headache = false;
        patient.stomache = false;
        NSLog(@"Patient %@ fell not good because of headache and stomache", patient.name);
    }
    
    if (patient.temperature >39.f && patient.temperature <= 42.f){
        [self makeBadShoot:patient];
        patient.temperature = 36.6f;
        NSLog(@"Patient %@ fell not good because of tempriture", patient.name);
    }
    
    
    if (patient.temperature >=37.f && patient.temperature <= 39.f){
        [self wrongDiagnosis:patient];
        patient.temperature = 36.6f;
        NSLog(@"Patient %@ fell not good because of tempriture", patient.name);
    }
    if (patient.headache) {
        [self eatFrog:patient];
        patient.headache = false;
        NSLog(@"Patient %@ fell not good because of headache", patient.name);
    }
    if (patient.stomache) {
        [self eatFrog:patient];
        patient.stomache = false;
        NSLog(@"Patient %@ fell not good because of stomache", patient.name);
    }
    
}

- (void) eatFrog:(Patient *)patient{
    NSLog(@"Patient %@ eats frog. BEAHH!", patient.name);
}

- (void) makeBadShoot:(Patient *)patient{
    NSLog(@"Doctor %@ make bad shot to patient %@", NSStringFromClass([self class]), patient.name);
}

- (void) wrongDiagnosis:(Patient *)patient{
    NSLog(@"Doctor make wrong diagnosis to patient %@", patient.name);
}


@end
