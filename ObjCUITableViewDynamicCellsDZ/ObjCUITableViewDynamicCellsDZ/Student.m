//
//  Student.m
//  ObjCUITableViewDynamicCellsDZ
//
//  Created by Eugene Mekhedov on 02.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithRandoom{
    self = [super init];
    if (self) {
        
        self.name = [self getRandoomName];
        self.secondName = [self getRandoomSecondName];
        self.averageMark = [self getRandoomAverageMark];
        
    }
    return self;
}

#pragma mark - Methods for init

-(NSString*) getRandoomName {
    
    NSArray* arrayOfNames = [[NSArray alloc] initWithObjects:   @"James",       @"John",      @"Robert",      @"Michael",     @"William",
                                                                @"David",       @"Richard",   @"Charles",     @"Joseph",      @"Thomas",
                                                                @"Christopher", @"Daniel",    @"Paul",        @"Mark",        @"Donald",
                                                                @"George",      @"Kenneth",   @"Steven",      @"Edward",      @"Brian"  ,nil];
    
    NSInteger randomNameIndex = arc4random() % [arrayOfNames count];
    return [arrayOfNames objectAtIndex:randomNameIndex];
}

-(NSString*) getRandoomSecondName {
    
    NSArray* arrayOfSecondNames = [[NSArray alloc] initWithObjects:   @"Smith",       @"Johnson",      @"Williams",      @"Jones",     @"Brown",
                                                                      @"Davis",       @"Miller",       @"Wilson",        @"Moore",     @"Taylor",
                                                                      @"Anderson",    @"Thomas",       @"Jackson",       @"White",     @"Harris",
                                                                      @"Martin",      @"Thompson",     @"Garcia",        @"Martinez",  @"Robinson",nil];
    
    NSInteger randomSecondNameIndex = arc4random() % [arrayOfSecondNames count];
    return [arrayOfSecondNames objectAtIndex:randomSecondNameIndex];
}

-(NSInteger) getRandoomAverageMark {
    
    NSInteger randomAverageMark = arc4random() % 12 + 1;
    return randomAverageMark;
}

@end
