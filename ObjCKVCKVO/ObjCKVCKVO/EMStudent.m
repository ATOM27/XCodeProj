//
//  EMStudent.m
//  ObjCKVCKVO
//
//  Created by Eugene Mekhedov on 02.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent.h"

@implementation EMStudent

-(void) setName:(NSString *)name{
    
    _name = name;
    
    NSLog(@"student setName: %@", name);
}

-(void) setAge:(NSInteger)age{
    
    _age = age;
    
    NSLog(@"student setAge: %ld", (long)age);
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Student: %@ %ld", self.name, (long)self.age];
}

-(void) setValue:(id)value forKey:(NSString *)key{
    
    NSLog(@"Student setValue: %@ forKey %@", value, key);
    
    [super setValue:value forKey:key];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    NSLog(@"setValueForUndefinedKey");
}

-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"valueForUndefinedKey");
    return nil;
}

-(void) changeNameWithIVar{
    
    [self willChangeValueForKey:@"name"];
    _name = @"Fake Name";
    [self didChangeValueForKey:@"name"];
}

//-(BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError{
//    
//    if ([inKey isEqualToString:@"name"]){
//        
//        NSString* newName = *ioValue;
//        
//        if (![newName isKindOfClass:[NSString class]]){
//            *outError = [[NSError alloc] initWithDomain:@"Not NSString" code:123 userInfo:nil];
//            return NO;
//        }
//        
//        if ([newName rangeOfString:@"1"].location != NSNotFound){
//            *outError = [[NSError alloc] initWithDomain:@"Has numbers" code:324 userInfo:nil];
//            return NO;
//        }
//    }
//    
//    return YES;
//}

-(BOOL)validateName:(id *)ioValue error:(NSError * __autoreleasing *)outError{
    
    NSLog(@"AAAAAA");
    
    return YES;
}
@end
