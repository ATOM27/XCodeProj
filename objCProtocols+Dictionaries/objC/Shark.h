//
//  Shark.h
//  objC
//
//  Created by Eugene Mekhedov on 29.02.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "Animal.h"
#import "Swimmers.h"

@interface Shark : Animal <Swimmers>

@property (assign, nonatomic) float timeWithoutBreathing;


@end
