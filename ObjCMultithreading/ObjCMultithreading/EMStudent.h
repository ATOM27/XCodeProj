//
//  EMStudent.h
//  ObjCMultithreading
//
//  Created by Eugene Mekhedov on 14.04.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EMStudent : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat startTime;

-(void) studentFindAnswer:(NSInteger)answer a: (NSInteger)a b: (NSInteger)b andBlock: (void(^)(NSString*, CGFloat)) block;

@end
