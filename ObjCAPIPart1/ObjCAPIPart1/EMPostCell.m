//
//  EMPostCell.m
//  ObjCAPIPart1
//
//  Created by Eugene Mekhedov on 16.03.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

#import "EMPostCell.h"

@implementation EMPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//+(CGFloat)heightForText:(NSString*)text{
//    
//    CGFloat offset = 5.f;
//    
//    UIFont* font = [UIFont systemFontOfSize:17.f];
//    NSShadow* shadow = [[NSShadow alloc] init];
//    shadow.shadowOffset = CGSizeMake(0, -50);
//    shadow.shadowBlurRadius = 0.5f;
//    
//    NSMutableParagraphStyle* paragraph = [[NSMutableParagraphStyle alloc] init];
//    [paragraph setLineBreakMode:NSLineBreakByWordWrapping];
//    [paragraph setAlignment:NSTextAlignmentCenter];
//    NSDictionary* attributes = @{
//                                 NSFontAttributeName:font,
//                                 NSParagraphStyleAttributeName: paragraph,
//                                 NSShadowAttributeName: shadow
//                                 };
//    
//    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, CGFLOAT_MAX);
//    
//    CGRect rect = [text boundingRectWithSize:size
//                                     options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
//                                  attributes:attributes
//                                     context:nil];
//    
//    return CGRectGetHeight(rect) + 2 * offset;
//}

@end
