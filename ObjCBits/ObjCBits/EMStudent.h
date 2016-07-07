//
//  EMStudent.h
//  ObjCBits
//
//  Created by Eugene Mekhedov on 28.04.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    
    EMStudentSubjectTypeBiology         = 1 << 0,
    EMStudentSubjectTypeMath            = 1 << 1,
    EMStudentSubjectTypeDevelopment     = 1 << 2,
    EMStudentSubjectTypeEngineering     = 1 << 3,
    EMStudentSubjectTypeArt             = 1 << 4,
    EMStudentSubjectTypePhylosophy      = 1 << 5,
    EMStudentSubjectTypeAnatomy         = 1 << 6
    
} EMStudentSubjectType;

@interface EMStudent : NSObject

@property (assign, nonatomic) EMStudentSubjectType subjectType;

-(EMStudentSubjectType) randomSubjectType: (NSInteger) subjectNumber;

@end
