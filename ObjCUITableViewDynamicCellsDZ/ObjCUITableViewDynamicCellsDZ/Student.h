//
//  Student.h
//  ObjCUITableViewDynamicCellsDZ
//
//  Created by Eugene Mekhedov on 02.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* secondName;
@property (assign, nonatomic) NSInteger averageMark;

-(instancetype)initWithRandoom;

@end
