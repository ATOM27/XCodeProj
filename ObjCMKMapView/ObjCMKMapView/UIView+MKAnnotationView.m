//
//  UIView+MKAnnotationView.m
//  ObjCMKMapView
//
//  Created by Eugene Mekhedov on 23.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "UIView+MKAnnotationView.h"
#import <MapKit/MKAnnotationView.h>

@implementation UIView (MKAnnotationView)

-(MKAnnotationView*) superAnnotationView{
    
    if ([self isKindOfClass: [MKAnnotationView class]]){
        
        return (MKAnnotationView*)self;
    }
    
    if (!self.superview){
        return nil;
    }
    
    return [self.superview superAnnotationView];
}

@end
