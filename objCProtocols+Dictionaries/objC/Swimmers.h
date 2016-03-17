//
//  Swimmers.h
//  objC
//
//  Created by Eugene Mekhedov on 28.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Swimmers <NSObject>

@required
@property (assign, nonatomic) float timeWithoutBreathing;

-(void) swim;

@optional
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger numberOfTooth;

@end
