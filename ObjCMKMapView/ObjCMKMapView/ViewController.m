//
//  ViewController.m
//  ObjCMKMapView
//
//  Created by Eugene Mekhedov on 21.09.16.
//  Copyright © 2016 Eugene Mekhedov. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "EMMapAnnotation.h"
#import "UIView+MKAnnotationView.h"

@interface ViewController () <MKMapViewDelegate> 
@property (strong, nonatomic) CLGeocoder* geoCoder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(actionAdd:)];
    
    UIBarButtonItem* zoomButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                               target:self
                                                                               action:@selector(actionShowAll:)];

    //-----------------------------------------------
    //To make some space between BarButtoItems use instance of UIBarButtonItems with 'UIBarButtonSystemItemFlexibleSpace' or 'UIBarButtonSystemItemFixedSpace' styles
//    UIBarButtonItem* fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                                                                target:nil
//                                                                                action:nil];
//    
//    fixedSpace.width = 50;
    
    UIBarButtonItem* flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                target:nil
                                                                                action:nil];
    
    //------------------------------------------------
    
    self.navigationItem.rightBarButtonItems = @[addButton, flexibleSpace, zoomButton];
    
    self.geoCoder = [[CLGeocoder alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    
    if ([self.geoCoder isGeocoding]){
        [self.geoCoder cancelGeocode];
    }

}

#pragma mark - Actions

-(void) actionAdd:(UIBarButtonItem*) sender{
    
    EMMapAnnotation* annotation = [[EMMapAnnotation alloc] init];
    
    annotation.title = @"Test title";
    annotation.subtitle = @"Test subtitle";
    annotation.coordinate = self.mapView.region.center;
    
    [self.mapView addAnnotation:annotation];
}

-(void) actionShowAll:(UIBarButtonItem*) sender{
    
    MKMapRect zoomRect = MKMapRectNull;
    
    for (id <MKAnnotation> annotation in self.mapView.annotations){
        
        CLLocationCoordinate2D location = annotation.coordinate;
        
        MKMapPoint center = MKMapPointForCoordinate(location);// This method returns point in rect
        
        static double delta = 20000;
        
        MKMapRect rect = MKMapRectMake( center.x - delta, center.y - delta, delta * 2, delta * 2);
        
        zoomRect = MKMapRectUnion(zoomRect, rect);
    }
    
    zoomRect = [self.mapView mapRectThatFits:zoomRect];
    
    [self.mapView setVisibleMapRect:zoomRect
                        edgePadding:UIEdgeInsetsMake(50, 50, 50, 50)
                           animated:YES];
}

-(void) actionDescription:(UIButton*) sender{
    
    MKAnnotationView* annotationView = [sender superAnnotationView];
    
    if (!annotationView){
        return;
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    CLLocation* location = [[CLLocation alloc] initWithLatitude:coordinate.latitude
                                                      longitude:coordinate.longitude];
    
    if ([self.geoCoder isGeocoding]){
        [self.geoCoder cancelGeocode];
    }
    
    [self.geoCoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                       
                       NSString* message = nil;
                       
                       if (error){
                           message = [error localizedDescription];
                       }else{
                           
                           if ([placemarks count] > 0){
                               
                               MKPlacemark* placeMark = [placemarks firstObject]; //отметина места на карте
                               
                               message = [placeMark.addressDictionary description];
                           }else{
                               message = @"No placemarks found.";
                           }
                       }
                       UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Location" message:message preferredStyle:UIAlertControllerStyleAlert];
                       
                       UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                       }];
                       
                       [alert addAction:ok];
                       [self presentViewController:alert animated:YES completion:nil];
                   }];
}

#pragma mark -  MKMapViewDelegate

/*
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    NSLog(@"regionWillChangeAnimated");
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    NSLog(@"regionDidChangeAnimated");
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView{
    NSLog(@"mapViewWillStartLoadingMap");
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    NSLog(@"mapViewDidFinishLoadingMap");
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error{
    NSLog(@"mapViewDidFailLoadingMap");
}

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView{
    NSLog(@"mapViewWillStartRenderingMap");
}
- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered{
    NSLog(@"mapViewDidFinishRenderingMap");
}
*/

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    static NSString* identifier = @"Annotation";
    
    MKPinAnnotationView* pin = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!pin){
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        pin.animatesDrop = YES;
        pin.canShowCallout = YES;
        pin.draggable = YES;
        pin.pinTintColor = [UIColor orangeColor];
        
        UIButton* descriptionButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [descriptionButton addTarget:self action:@selector(actionDescription:) forControlEvents:UIControlEventTouchUpInside];
        
        pin.rightCalloutAccessoryView = descriptionButton;
    }else{
        pin.annotation = annotation;
    }
    
    return pin;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState{
    //not nessessary
    if (newState == MKAnnotationViewDragStateEnding){
        
        CLLocationCoordinate2D location = view.annotation.coordinate;
        MKMapPoint point = MKMapPointForCoordinate(location);
        
        NSLog(@"location = {%f , %f}\npoint = %@",location.latitude, location.longitude, MKStringFromMapPoint(point));
    }
}

@end
