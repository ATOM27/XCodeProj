//
//  EMStudent.h
//  ObjCKVCKVO
//
//  Created by Eugene Mekhedov on 02.10.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMStudent : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;

-(void) changeNameWithIVar;

@end
