//
//  EMSection.h
//  ObjCUITableViewSearch
//
//  Created by Eugene Mekhedov on 29.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMSection : NSObject

@property (strong, nonatomic) NSString* sectionName;
@property (strong, nonatomic) NSMutableArray* itemsArray;

@end
