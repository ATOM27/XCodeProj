//
//  EMSections.h
//  ObjCUITableViewDynamicCellsDZ
//
//  Created by Eugene Mekhedov on 04.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMSections : NSObject

@property (strong, nonatomic) NSMutableArray* arrayOfStudentsInSection;

- (instancetype)init;
@end
