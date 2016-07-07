//
//  EMStudent.m
//  ObjCMultithreading
//
//  Created by Eugene Mekhedov on 14.04.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStudent.h"

@implementation EMStudent

-(void) studentFindAnswer:(NSInteger)answer a: (NSInteger)a b: (NSInteger)b andBlock:(void (^)(NSString*, CGFloat))block{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
              _startTime = CACurrentMediaTime();
              NSInteger studentAnswer = arc4random()%b + a;
              while (studentAnswer != answer){
                  studentAnswer = arc4random()%b + a;
              }
        dispatch_async(dispatch_get_main_queue(), ^{
            block(self.name, self.startTime);
        });
    });
}

-(void)dealloc{
    NSLog(@"%@ dealocated", self.name);
}

@end
