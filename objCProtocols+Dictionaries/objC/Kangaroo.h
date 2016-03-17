//
//  Kangaroo.h
//  objC
//
//  Created by Eugene Mekhedov on 29.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Animal.h"
#import "Jumpers.h"
@interface Kangaroo : Animal <Jumpers>

@property (assign, nonatomic) NSInteger high;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* colorOfEyes;




@end
