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
//@property (assign, nonatomic) CGContextRef context;
@property (strong, nonatomic) NSMutableArray* points;
@end

@implementation EMStar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.points = [[NSMutableArray alloc] init];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //self.centerPointsOfCercles = [[NSMutableArray alloc] init];
    NSLog(@"Draw rect in: %@", NSStringFromCGRect(rect));
    //self.points = [[NSMutableArray alloc] init];
    
    
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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.f);
    CGContextSetStrokeColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGPoint beginPoint;
    if ([self.points count] > 0){
        beginPoint = [[self.points objectAtIndex:0] CGPointValue];
    }
    
    for (int i = 1; i < [self.points count]; i++){
        if (rect.size.height < beginPoint.x){
            if (i+1 < [self.points count]){
                beginPoint = [[self.points objectAtIndex:i+1] CGPointValue];
                continue;
            }
        }
        CGContextMoveToPoint(context, beginPoint.x, beginPoint.y);
        CGPoint endPoint = [[self.points objectAtIndex:i] CGPointValue];
        if (rect.size.height < endPoint.x){
            beginPoint = endPoint;
            continue;
            }
        
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        beginPoint = endPoint;
        CGContextStrokePath(context);
    }

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

#pragma mark - Touches

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    CGPoint pointInDrawingView = [touch locationInView:self];
    
    NSLog(@"Touches began in point: %@", NSStringFromCGPoint(pointInDrawingView));
    [self.points addObject:[NSValue valueWithCGPoint:pointInDrawingView]]; // begin point
    //[self.drawingView setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    CGPoint pointInDrawingView = [touch locationInView:self];
    [self setNeedsDisplay];
    
    NSLog(@"Touches moved in point: %@", NSStringFromCGPoint(pointInDrawingView));
    [self.points addObject:[NSValue valueWithCGPoint:pointInDrawingView]];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.points addObject:[NSValue valueWithCGPoint:CGPointMake(1000, 1000)]];
    [self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setNeedsDisplay];
}


@end
