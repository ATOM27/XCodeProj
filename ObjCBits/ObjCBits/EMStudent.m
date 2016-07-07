//
//  EMStudent.m
//  ObjCBits
//
//  Created by Eugene Mekhedov on 28.04.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent.h"

@implementation EMStudent

-(NSString*) answerByType:(EMStudentSubjectType) type{
    return self.subjectType & type ? @"yes" : @"no";
}

-(NSString*)description{
    return [NSString stringWithFormat:@"Student subjects:\n "
                                      "boilogy = %@\n"
                                      "math = %@\n"
                                      "development = %@\n"
                                      "engineering = %@\n"
                                      "art = %@\n"
                                      "phylosophy = %@\n"
                                      "anatomy = %@",
                                        [self answerByType:EMStudentSubjectTypeBiology],
                                        [self answerByType:EMStudentSubjectTypeMath],
                                        [self answerByType:EMStudentSubjectTypeDevelopment],
                                        [self answerByType:EMStudentSubjectTypeEngineering],
                                        [self answerByType:EMStudentSubjectTypeArt],
                                        [self answerByType:EMStudentSubjectTypePhylosophy],
                                        [self answerByType:EMStudentSubjectTypeAnatomy]];
}

-(EMStudentSubjectType) randomSubjectType: (NSInteger) subjectNumber;{
    EMStudentSubjectType subj;
    switch(subjectNumber){
        case 0:
            subj = EMStudentSubjectTypeBiology;
            break;
        case 1:
            subj = EMStudentSubjectTypeMath;
            break;
        case 2:
            subj = EMStudentSubjectTypeDevelopment;
            break;
        case 3:
            subj = EMStudentSubjectTypeEngineering;
            break;
        case 4:
            subj = EMStudentSubjectTypeArt;
            break;
        case 5:
            subj = EMStudentSubjectTypePhylosophy;
            break;
        case 6:
            subj = EMStudentSubjectTypeAnatomy;
            break;
    }
    return subj;
}



@end
