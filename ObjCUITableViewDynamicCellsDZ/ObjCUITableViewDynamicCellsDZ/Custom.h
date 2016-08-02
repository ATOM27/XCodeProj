//
//  Custom.h
//  ObjCUITableViewDynamicCellsDZ
//
//  Created by Eugene Mekhedov on 02.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Custom : UIView

@property (strong, nonatomic) UIColor* color;
@property (strong, nonatomic) NSString* name;

-(instancetype)initWithColor:(UIColor*) color;

@end
