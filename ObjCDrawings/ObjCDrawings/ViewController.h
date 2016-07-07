//
//  ViewController.h
//  ObjCDrawings
//
//  Created by Eugene Mekhedov on 06.07.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet DrawingView *drawing;

@end

