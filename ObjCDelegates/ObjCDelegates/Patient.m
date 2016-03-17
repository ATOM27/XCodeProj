//
//  Patient.m
//  ObjCDelegates
//
//  Created by Eugene Mekhedov on 05.03.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Patient.h"

@implementation Patient


- (void) howAreYou:(void (^) (Patient*)) block{
     NSLog(@"Patient %@ feels not good", self.name);
    block(self);
   // [self.delegate patientFeelsBad:self];
}
//    if (self.temperature > 36.6f || self.stomache || self.headache)
//    {
//        NSLog(@"Patient %@ feels not good", self.name);
//        [self.delegate patientFeelsBad:self];
//        NSLog(@"Patient %@ now feels good", self.name);
//    }
//    else{
//        NSLog(@"Patient %@ feels good", self.name);
//        
//    }
//}
//
- (void) takePill{
    NSLog(@"Patient %@ take a pill", self.name);
 
}

- (void) makeShoot{
    NSLog(@"Patient %@ make a shoot", self.name);
}

- (void) feelWarse{
    
    if (!self.headache){
        self.headache = true;
    }
    
   else if (!self.stomache){
        self.stomache = true;
    }
    
    self.temperature += 3.4f;
    NSLog(@"Patient %@ feels warse", self.name);
   // [self.delegate patientFeelsBad:self];
}

@end
