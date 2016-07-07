//
//  ViewController.m
//  ObjCTouchesDZ
//
//  Created by Eugene Mekhedov on 27.06.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.redCheckersArray = [[NSMutableArray alloc] init];
    self.greenCheckersArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 12; i++){
        UIView* currentCell = [self.blackCellsCollection objectAtIndex:i];
        [self setCheckersInArray:self.redCheckersArray withColor:[UIColor redColor] inCell:currentCell];
    }
    
    for (NSInteger i = self.blackCellsCollection.count-1; i > 19; i--){
        UIView* currentCell = [self.blackCellsCollection objectAtIndex:i];
        [self setCheckersInArray:self.greenCheckersArray withColor:[UIColor greenColor] inCell:currentCell];
    }
    
    self.view.multipleTouchEnabled = FALSE;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - chekers functions

-(void) setCheckersInArray:(NSMutableArray*) checkers withColor:(UIColor*) color inCell:(UIView*) currentCell{
    UIView* check = [[UIView alloc] initWithFrame:CGRectMake(currentCell.center.x, currentCell.center.y, CGRectGetWidth(currentCell.bounds) / 2, CGRectGetHeight(currentCell.bounds) / 2)];
    check.center = currentCell.center;
    check.backgroundColor = color;
    check.layer.cornerRadius = 10.f;
    [checkers addObject:check];
    [self.blackCellsBoardView addSubview:check];
    [self.view bringSubviewToFront:check];

}

-(BOOL) checkForACheckerView:(UIView*) touchedView {
    BOOL isItChecker = FALSE;
    
    NSMutableArray* checkers = [[NSMutableArray alloc] initWithArray:self.greenCheckersArray];
    [checkers addObjectsFromArray:self.redCheckersArray];
    
    for (UIView* checkerView in checkers){
        if ([touchedView isEqual:checkerView]){
            isItChecker = TRUE;
            return isItChecker;
        }
    }
    
    return isItChecker;
}

#pragma mark - touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    UITouch* touch = [touches anyObject];
    
    CGPoint pointInMainView = [touch locationInView:self.view];
    UIView* touchedView = [self.view hitTest:pointInMainView withEvent:event];
    
    if ([self checkForACheckerView:touchedView]){
        self.draggingView = touchedView;
        self.lastGoodCheckerPoint = self.draggingView.center;
        [self.view bringSubviewToFront:self.draggingView];
        
        [UIView animateWithDuration:0.3f
                         animations:^{
                             self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                             self.draggingView.alpha = 0.6f;
                         }];
        
        CGPoint pointInDraggingView = [touch locationInView:self.draggingView];
        
        self.delta = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - pointInDraggingView.x, CGRectGetMidY(self.draggingView.bounds) - pointInDraggingView.y);
        
        CGPoint pointInBoardView = [touch locationInView:self.blackCellsBoardView];
        NSLog(@"touchesBegan in point: %@", NSStringFromCGPoint(pointInBoardView));
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    
    UITouch* touch = [touches anyObject];
    
    CGPoint movedPointInBoardView = [touch locationInView:self.blackCellsBoardView];
    NSLog(@"touchesMoved in point: %@", NSStringFromCGPoint(movedPointInBoardView));
    
    if (self.draggingView){
        
        self.draggingView.center = CGPointMake(movedPointInBoardView.x + self.delta.x,
                                               movedPointInBoardView.y + self.delta.y);
    }

}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    if ([self outOfBoard:touches methodName:@"touchesEnded"]){
        UIView* bestBlackCell = [self findBestCellForChecker];
        
        if ([self cellIsFree:bestBlackCell]){
             self.draggingView.center = bestBlackCell.center;
        }
        else{
            self.draggingView.center = self.lastGoodCheckerPoint;
        }
       
    }
    [self endAnimation];

}
- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    
    if ([self outOfBoard:touches methodName:@"touchesCencelled"]){
    
    }
    [self endAnimation];

}

#pragma mark - DRY

-(BOOL) cellIsFree: (UIView*) bestBlackCell {
    NSMutableArray* checkers = [[NSMutableArray alloc] initWithArray:self.greenCheckersArray];
    [checkers addObjectsFromArray:self.redCheckersArray];
    
    for (UIView* chacker in checkers){
        if (CGPointEqualToPoint(chacker.center, bestBlackCell.center)){
            return false;
        }
    }
    
    return true;
}

-(UIView*) findBestCellForChecker{
    
    CGFloat minDistance = CGFLOAT_MAX;
    UIView* nearesBlackCell = [[UIView alloc] init];
    for (UIView* blackCellView in self.blackCellsCollection){
        CGFloat distance = sqrt(pow(blackCellView.center.x - self.draggingView.center.x, 2.f) +
                                (pow(blackCellView.center.y - self.draggingView.center.y, 2.f)));
        if (minDistance > distance){
            minDistance = distance;
            nearesBlackCell = blackCellView;
        }
    }
    
    return nearesBlackCell;
    
}

-(BOOL) outOfBoard:(nullable NSSet<UITouch *> *)touches methodName:(NSString*) methodName{
    
    UITouch* touch = [touches anyObject];
    
    CGPoint pointInBoardView = [touch locationInView:self.blackCellsBoardView];
    NSLog(@"%@ in point: %@",methodName , NSStringFromCGPoint(pointInBoardView));
    
    CGFloat minInPoint = MIN(pointInBoardView.x, pointInBoardView.y);
    CGFloat maxInPoint = MAX(pointInBoardView.x, pointInBoardView.y);
    
    if (minInPoint < 0 || maxInPoint > CGRectGetWidth(self.blackCellsBoardView.bounds)){
        self.draggingView.center = self.lastGoodCheckerPoint;
        return false;
    }
    
    return true;

}

-(void) endAnimation {
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity;
                         self.draggingView.alpha = 1.f;
                     }];
    
    self.draggingView = nil;
}
@end
