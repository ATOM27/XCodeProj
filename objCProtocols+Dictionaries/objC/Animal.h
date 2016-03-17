//
//  Animal.h
//  objC
//
//  Created by Eugene Mekhedov on 29.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (strong, nonatomic) NSString* typeOfAnimal;

-(void) movement;

@end
