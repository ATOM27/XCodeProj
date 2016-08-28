//
//  UITableViewCellCategory.h
//  ObjCUITableViewNavigationPart2
//
//  Created by Eugene Mekhedov on 28.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CellCategory)

-(unsigned long long) superSize:(NSString*) path;

@end