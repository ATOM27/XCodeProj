//
//  EMStudent.m
//  ObjCKVCKVODZ
//
//  Created by Eugene Mekhedov on 05.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent.h"

@implementation EMStudent

- (instancetype)initWithRandoom{
    self = [super init];
    if (self) {
        
        self.firstName = [self getRandoomFirstName];
        self.lastName = [self getRandoomLastName];
        self.dateOfBirth = [self getRandomDateOfBirth];
        self.gender = arc4random()%2;
        
    }
    return self;
}

-(void) resetAllValuesWithIVar{
    [self willChangeValueForKey:@"firstName"];
    _firstName = @"";
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = @"";
    [self didChangeValueForKey:@"lastName"];
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = nil;
    [self didChangeValueForKey:@"dateOfBirth"];
    
    [self willChangeValueForKey:@"gender"];
    _gender = nil;
    [self didChangeValueForKey:@"gender"];
}

#pragma mark - Methods for init

-(NSString*) getRandoomFirstName {
    
    NSArray* arrayOfNames = [[NSArray alloc] initWithObjects:   @"James",       @"John",      @"Robert",      @"Michael",     @"William",
                             @"David",       @"Richard",   @"Charles",     @"Joseph",      @"Thomas",
                             @"Christopher", @"Daniel",    @"Paul",        @"Mark",        @"Donald",
                             @"George",      @"Kenneth",   @"Steven",      @"Edward",      @"Brian"  ,nil];
    
    NSInteger randomNameIndex = arc4random() % [arrayOfNames count];
    return [arrayOfNames objectAtIndex:randomNameIndex];
}

-(NSString*) getRandoomLastName {
    
    NSArray* arrayOfSecondNames = [[NSArray alloc] initWithObjects:   @"Smith",       @"Johnson",      @"Williams",      @"Jones",     @"Brown",
                                   @"Davis",       @"Miller",       @"Wilson",        @"Moore",     @"Taylor",
                                   @"Anderson",    @"Thomas",       @"Jackson",       @"White",     @"Harris",
                                   @"Martin",      @"Thompson",     @"Garcia",        @"Martinez",  @"Robinson",nil];
    
    NSInteger randomSecondNameIndex = arc4random() % [arrayOfSecondNames count];
    return [arrayOfSecondNames objectAtIndex:randomSecondNameIndex];
}

-(NSDate*) getRandomDateOfBirth{
    NSDate* date = [NSDate date];
    
    double hour = 3600.f;
    double day = hour*24;
    double year = day*365;
    
    double rangeYear = arc4random()% 31 + 5;
    double rangeDay = arc4random()% 30;
    double rangeHour = arc4random()% 25;
    
    double rangeDate = (rangeYear * year) + (rangeDay * day) + (rangeHour * hour);
    date = [NSDate dateWithTimeIntervalSince1970:rangeDate];
    NSLog(@"%@", date);
    return date;
}


@end
