//
//  EMSections.h
//  ObjCUITableViewSearchDZ
//
//  Created by Eugene Mekhedov on 02.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMSections : NSObject

@property (strong, nonatomic) NSString* sectionName;
@property (strong, nonatomic) NSMutableArray* studentsInSection;

@end
