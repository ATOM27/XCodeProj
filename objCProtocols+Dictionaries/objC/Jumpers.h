//
//  Jumpers.h
//  objC
//
//  Created by Eugene Mekhedov on 28.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Jumpers <NSObject>

@required
@property (assign, nonatomic) NSInteger high;

-(void) jump;

@optional
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* colorOfEyes;


@end
