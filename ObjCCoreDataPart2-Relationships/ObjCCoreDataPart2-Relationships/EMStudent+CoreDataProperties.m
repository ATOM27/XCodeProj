//
//  EMStudent+CoreDataProperties.m
//  ObjCCoreDataPart2-Relationships
//
//  Created by Eugene Mekhedov on 24.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent+CoreDataProperties.h"

@implementation EMStudent (CoreDataProperties)

+ (NSFetchRequest<EMStudent *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EMStudent"];
}

@dynamic firstName;
@dynamic lastName;
@dynamic score;
@dynamic dateOfBirth;

-(void) setFirstName:(NSString *)firstName{
    
    [self willChangeValueForKey:@"firstName"];
    [self setPrimitiveValue:firstName forKey:@"firstName"];//primitive is need to save paramethers
    [self didChangeValueForKey:@"firstName"];
    
    NSLog(@"SET FIRST NAME!!!");
}

-(NSString*) firstName{
    
    NSString* string = nil;
    
    [self willAccessValueForKey:@"firstName"];
    string = [self primitiveValueForKey:@"firstName"];
    [self didAccessValueForKey:@"firstName"];
    
    return string;
}

//validating

-(BOOL) validateFirstName:(id  _Nullable __autoreleasing *)value error:(NSError * _Nullable __autoreleasing *)error{
    
    *error = [NSError errorWithDomain:@"BAD FIRST NAME" code:123 userInfo:nil];
    
    NSLog(@"VALIDATING!!!");
    
    return NO;
}


@end
