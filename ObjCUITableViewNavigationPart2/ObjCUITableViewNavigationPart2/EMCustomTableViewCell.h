//
//  EMCustomTableViewCell.h
//  ObjCUITableViewNavigationPart2
//
//  Created by Eugene Mekhedov on 22.08.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fileName;
@property (weak, nonatomic) IBOutlet UILabel *fileSize;
@property (weak, nonatomic) IBOutlet UILabel *fileDate;

@end
