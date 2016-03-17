//
//  Runner.h
//  objC
//
//  Created by Eugene Mekhedov on 29.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Human.h"
#import "Runners.h"
@interface Runner : Human <Runners>

@property (assign, nonatomic) float maxSpeed;


@end
