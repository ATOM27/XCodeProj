//
//  DrawingView.m
//  ObjCDrawings
//
//  Created by Eugene Mekhedov on 06.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSLog(@"Draw rect in: %@", NSStringFromCGRect(rect));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);    // "Fill" is using for internal rect
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);  // "Stroke" is using for border
    //CGContextFillRect(context, rect);
    
    CGRect square1 = CGRectMake(100, 100, 100, 100);
    CGRect square2 = CGRectMake(200, 200, 100, 100);
    CGRect square3 = CGRectMake(300, 300, 100, 100);
    
    CGContextAddRect(context, square1);
    CGContextAddRect(context, square2);
    CGContextAddRect(context, square3);
    
    //CGContextFillPath(context);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    
    CGContextAddEllipseInRect(context, square1);
    CGContextAddEllipseInRect(context, square2);
    CGContextAddEllipseInRect(context, square3);
    
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    
    CGContextSetLineWidth(context, 5.f);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //First line
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddLineToPoint(context, CGRectGetMinX(square3), CGRectGetMaxY(square3));
    
    //Second line
    CGContextMoveToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    CGContextAddLineToPoint(context, CGRectGetMaxX(square1), CGRectGetMinY(square1));
    
    CGContextStrokePath(context);
    
    //Arc
    CGContextSetStrokeColorWithColor(context, [UIColor brownColor].CGColor);
    CGContextSetLineWidth(context, 2.f);
    
    CGPoint centreOfArc = CGPointMake(CGRectGetMaxX(square1) , CGRectGetMaxY(square1));
    CGFloat radiusOfArc = CGRectGetWidth(square1);
    CGContextAddArc(context, centreOfArc.x, centreOfArc.y, radiusOfArc, M_PI, M_PI_2, true);
    
    CGContextStrokePath(context);
    
    //----------------TEXT-----------
    
    NSString* text = @"Test";
    
    UIFont* font = [UIFont systemFontOfSize:14.f];
    
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(6, -6);
    shadow.shadowBlurRadius = 0.5f;
    
    NSDictionary* textAttribues =
    [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor blackColor], NSForegroundColorAttributeName,
     font, NSFontAttributeName,
     shadow, NSShadowAttributeName,nil];
    
    CGSize textSize = [text sizeWithAttributes:textAttribues];
    
    // Save from blur text: CGRectIntegral - this method rounds CGRect variables
    CGRect textRect = CGRectMake(CGRectGetMidX(square2) - textSize.width / 2, CGRectGetMidY(square2) - textSize.height / 2, textSize.width, textSize.height);
    textRect = CGRectIntegral(textRect);
    
    [text drawInRect:textRect withAttributes:textAttribues];
    //[text drawAtPoint:CGPointMake(CGRectGetMidX(square2) - textSize.width, CGRectGetMidY(square2) - textSize.height) withAttributes:textAttribues];

}


@end
