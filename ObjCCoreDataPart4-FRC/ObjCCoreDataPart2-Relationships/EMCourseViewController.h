//
//  EMCourseViewController.h
//  ObjCCoreDataPart4-FRC
//
//  Created by Eugene Mekhedov on 14.11.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMCoreDataTableViewController.h"

@class EMUniversity;

@interface EMCourseViewController : EMCoreDataTableViewController

@property (strong, nonatomic) EMUniversity* university;

@end
