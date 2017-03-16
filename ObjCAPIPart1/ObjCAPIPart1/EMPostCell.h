//
//  EMPostCell.h
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 16.03.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMPostCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel* postTextLabel;

+(CGFloat) heightForText:(NSString*)text;


@end
