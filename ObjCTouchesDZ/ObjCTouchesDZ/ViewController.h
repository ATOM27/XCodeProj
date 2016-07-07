//
//  ViewController.h
//  ObjCTouchesDZ
//
//  Created by Eugene Mekhedov on 27.06.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *boardImageView;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *blackCellsCollection;
@property (weak, nonatomic) IBOutlet UIView *blackCellsBoardView;
@property (strong, nonatomic) NSMutableArray* redCheckersArray;
@property (strong, nonatomic) NSMutableArray* greenCheckersArray;
@property (strong, nonatomic) UIView* draggingView;
@property (assign, nonatomic) CGPoint delta;
@property (assign, nonatomic) CGPoint lastGoodCheckerPoint;


@end

