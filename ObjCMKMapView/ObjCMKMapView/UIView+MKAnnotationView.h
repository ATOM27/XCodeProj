//
//  UIView+MKAnnotationView.h
//  ObjCMKMapView
//
//  Created by Eugene Mekhedov on 23.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKAnnotationView;
@interface UIView (MKAnnotationView)

-(MKAnnotationView*) superAnnotationView;

@end
