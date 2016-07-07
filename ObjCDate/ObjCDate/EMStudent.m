//
//  EMStudent.m
//  ObjCDate
//
//  Created by Eugene Mekhedov on 03.05.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent.h"

@implementation EMStudent

-(void) setNameAndSername:(NSInteger) randNameNumber surname:(NSInteger) randSurnameNumber{
    switch (randNameNumber) {
            case 1:
                _name = @"Alex";
                break;
            case 2:
                _name = @"Brayan";
                break;
            case 3:
                _name = @"Eugene";
                break;
            case 4:
                _name = @"Carl";
                break;
            case 5:
                _name = @"Cris";
                break;
    }
    switch (randSurnameNumber) {
        case 1:
            _surname = @"Black";
            break;
        case 2:
            _surname = @"Gray";
            break;
        case 3:
            _surname = @"Green";
            break;
        case 4:
            _surname = @"Forbs";
            break;
        case 5:
            _surname = @"Tatum";
            break;
        default:
            break;
    }
}


@end
