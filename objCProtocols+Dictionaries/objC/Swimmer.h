//
//  Swimmer.h
//  objC
//
//  Created by Eugene Mekhedov on 29.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Human.h"
#import "Swimmers.h"

@interface Swimmer : Human <Swimmers>

@property (assign, nonatomic) float timeWithoutBreathing;


@end
