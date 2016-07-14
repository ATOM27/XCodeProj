//
//  EMStar.m
//  ObjCDrawingsDZ
//
//  Created by Eugene Mekhedov on 12.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "EMStar.h"

@interface EMStar()

@property (strong, nonatomic) NSMutableArray* centerPointsOfCercles;

@end

@implementation EMStar


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //self.centerPointsOfCercles = [[NSMutableArray alloc] init];
    NSLog(@"Draw rect in: %@", NSStringFromCGRect(rect));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // -------Uncommnet if you want draw stars-----------
    
//    NSInteger xCenter = CGRectGetMidX(rect);
//    NSInteger yCenter = CGRectGetMidY(rect);
//    
//    CGFloat w = 100.0;
//    CGFloat r = w / 2.0;
//    CGFloat flip = -1.0;
//    CGFloat theta = 2.0 * M_PI * (2.0 / 5.0);
//    
//    [self drawStarWithContext:context xCenter:xCenter yCenter:yCenter w:w r:r flip:flip theta:theta];
//    [self drawCirclesWithContext:context xCenter:xCenter yCenter:yCenter w:w r:r flip:flip theta:theta];
//    [self makeLinesWithContext:context];
//    
//    for (NSInteger i = 0; i < 5; i++){
//        
//        CGFloat r = (arc4random() % 20) + 20;
//        CGFloat x = r * sin(0 * theta);
//        CGFloat y = r * cos(0 * theta);
//        
//        NSInteger xCenter =((arc4random() % (NSInteger)CGRectGetWidth(rect)) - x);
//        NSInteger yCenter =((arc4random() % (NSInteger)CGRectGetHeight(rect)) - (y / flip));
//        
//        [self drawLittleStarWithContext:context w:w r:r flip:flip theta:theta xCenter:xCenter yCenter:yCenter rect:rect];
//        [self drawCirclesWithContext:context xCenter:xCenter yCenter:yCenter w:w r:r flip:flip theta:theta];
//        [self makeLinesWithContext:context];
//    }
    
    // ----------drawing app--------
    
    CGContextSetFillColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGContextMoveToPoint(context, self.beginPointDraw.x, self.beginPointDraw.y);
    //CGFloat finishAngle = M_PI * 2;
    //CGContextAddArc(context, self.pointDraw.x, self.pointDraw.y, 10, 0, finishAngle, 0);
    CGContextAddLineToPoint(context, self.pointDraw.x, self.pointDraw.y);
    //CGContextAddEllipseInRect(context, CGRectMake(self.pointDraw.x - 5, self.pointDraw.y - 5, 10, 10));
    self.beginPointDraw = self.pointDraw;
    CGContextFillPath(context);
}

#pragma mark - Exersises

-(void) drawStarWithContext:(CGContextRef) context xCenter:(NSInteger) xCenter yCenter:(NSInteger) yCenter w:(CGFloat) w r:(CGFloat) r flip:(CGFloat) flip theta:(CGFloat) theta{
    
    CGContextSetFillColorWithColor(context, [[self randomColor] CGColor]);
    
    
    
    CGContextMoveToPoint(context, xCenter, yCenter);
    
    for (NSInteger k=0; k<6; k++)
    {
        CGFloat x = r * sin(k * theta);
        CGFloat y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    
    CGContextFillPath(context);
}

-(void) drawCirclesWithContext:(CGContextRef) context xCenter:(NSInteger) xCenter yCenter:(NSInteger) yCenter w:(CGFloat) w r:(CGFloat) r flip:(CGFloat) flip theta:(CGFloat) theta{
    
//    CGFloat prevX = (r * sin(0))+xCenter - 5;
//    CGFloat prevY = (r * cos(0)) * flip + yCenter - 5;
    
    for (NSInteger k=0; k<5; k++)
    {
        CGFloat x = r * sin(k * theta);
        CGFloat y = r * cos(k * theta);
        
        CGContextSetFillColorWithColor(context, [[UIColor orangeColor] CGColor]);
        CGContextAddEllipseInRect(context, CGRectMake(x+xCenter - 5, y*flip+yCenter - 5, 10, 10));
        
        NSLog(@"Circle #%ld in center point: %@", (long)k, NSStringFromCGRect(CGRectMake(x+xCenter - 5, y*flip+yCenter - 5, 10, 10)));
        [self.centerPointsOfCercles addObject:[NSValue valueWithCGPoint:CGPointMake(x+xCenter, y*flip+yCenter)]];
        CGContextFillPath(context);
    }

}

-(void) makeLinesWithContext:(CGContextRef) context{
    for (int i = 0; i < 5; i++){
        CGContextSetStrokeColorWithColor(context, [[self randomColor] CGColor]);
        
        CGPoint first = [[self.centerPointsOfCercles objectAtIndex:i] CGPointValue];
        CGPoint second;
        
        if (i+3 <= [self.centerPointsOfCercles count] - 1){
            second = [[self.centerPointsOfCercles objectAtIndex:i+3] CGPointValue];
        }
        else{
            second = [[self.centerPointsOfCercles objectAtIndex:i-2] CGPointValue];
        }
        
        CGContextMoveToPoint(context, first.x, first.y);
        CGContextAddLineToPoint(context, second.x, second.y);
        
        CGContextStrokePath(context);
    }
    [self.centerPointsOfCercles removeAllObjects];
    //NSLog(@"%@", self.centerPointsOfCercles);
}

-(void) drawLittleStarWithContext:(CGContextRef) context w:(CGFloat) w r:(CGFloat) r flip:(CGFloat) flip theta:(CGFloat) theta xCenter:(CGFloat) xCenter yCenter:(CGFloat) yCenter rect:(CGRect) rect{

    CGContextSetFillColorWithColor(context, [[self randomColor] CGColor]);
    
    CGContextMoveToPoint(context, xCenter, yCenter);
    
    for (NSInteger k=0; k<6; k++)
    {
        CGFloat x = r * sin(k * theta);
        CGFloat y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
        
    }
    
    CGContextFillPath(context);
}

#pragma mark - Methods

-(UIColor*) randomColor{
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1.f];
}

@end
