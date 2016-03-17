//
//  Human.h
//  objC
//
//  Created by Eugene Mekhedov on 29.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    Male,
    Female
} Gender;

@interface Human : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float height;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) Gender gender;

-(void) movement;

@end
