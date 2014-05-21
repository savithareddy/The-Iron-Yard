//
//  MAPViewController.m
//  Maps
//
//  Created by Savitha Reddy on 5/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "MAPViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MAPAnnotation.h"

@interface MAPViewController () <CLLocationManagerDelegate,MKMapViewDelegate>

@end

@implementation MAPViewController
{
    CLLocationManager *lManager;
    MKMapView *myMapView;
    MAPAnnotation *annotation;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        [lManager startUpdatingLocation];
//        lManager.desiredAccuracy = kCLLocationAccuracy
        lManager.distanceFilter = 10;// to stop updating every sec just update once for that location
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [myMapView removeAnnotations:myMapView.annotations];
    
    // to put the pin from one location to another location , mapView.annotations ia an array
    for (CLLocation *location in locations) {
        annotation = [[MAPAnnotation alloc] initWithCoordinate:location.coordinate];
        
        annotation.title = @"Marker";
        annotation.subtitle = @"City"; // t is lowercase
       
        [myMapView addAnnotation:annotation];// annotation is the pin
//        [mapView setCenterCoordinate:location.coordinate animated:YES]; // this statement
//        [mapView setZoomEnabled:<#(BOOL)#>]
        //to zoom to the location using delta values 1.0 and 1.0 and location.cordinate is the center
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate,MKCoordinateSpanMake(1.0, 1.0));
        [myMapView setRegion:region animated:YES];
//        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
//        [mapview addSubview:annotationView];
        [myMapView selectAnnotation:annotation animated:YES]; //selectAnnotaion is not required since we are doing canshowcallout
//        NSLog(@"%@",location);
        CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
           
            for (CLPlacemark *placemark in placemarks) {
                 NSLog(@"%@",placemark.country);
                NSString *cityState = [NSString stringWithFormat:@"%@,%@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                [annotation setTitle :cityState];
                [annotation setSubtitle :placemark.country];
                

                
            }
        }];
    }
//    [lManager stopUpdatingLocation];// to update only once and stop
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *annotationView = [myMapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    if (annotationView == nil) // similar to tableview reuse
    {
   annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    }else{
        annotationView.annotation = annotation;
    }
    //annotationView has pin as subclass
    //remove pin from MKPinAnnotationView and add another image to the annotation view as annotationView.image = [UIImage imageNamed : @"yellowSmilie"];
    annotationView.draggable = YES;
     annotationView.canShowCallout = YES;
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"%@", view.annotation.title);
    
}

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    NSLog(@"new state: %d and old state %d",(int)newState,(int)oldState); // 4 states can be run on this refer apple docs
    switch ((int)newState) {
        case 0://not dragging
        {
            [mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
            CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
            CLLocation *location = [[CLLocation alloc]initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
            [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
                
                for (CLPlacemark *placemark in placemarks) {
                    NSLog(@"%@",placemark.addressDictionary);
                    NSString *cityState = [NSString stringWithFormat:@"%@,%@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                    [(MAPAnnotation *)view.annotation setTitle :cityState]; //inline statement to say to it that title and subtitle are property of MAPAnnotation
                    [(MAPAnnotation *)view.annotation setSubtitle :placemark.country];
                   
                }
            }];
            }
             break;
        case 1://start dragging
            
            break;

        case 2:// dragging
            
            break;

        case 4://ending dragging
            
            break;
            

            
        default:
            break;
    }
}

-(void)foundTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:myMapView];
    
    CLLocationCoordinate2D tapPoint = [myMapView convertPoint:point toCoordinateFromView:self.view];
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    
    point1.coordinate = tapPoint;
    
    [myMapView addAnnotation:point1];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//
//    CGPoint point = [touch locationInView:self.view];
//    NSLog(@"X location: %f", point.x);
//    NSLog(@"Y Location: %f",point.y);
//    
//    MKPinAnnotationView  *pin = [[MKPinAnnotationView alloc] initWithFrame:CGRectMake(point.x, point.y, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:pin];
//   
//    
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //MKMapView  statements just show the default map
    myMapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    
    myMapView.delegate = self; // should be created added only after mapView is created
    [self.view addSubview:myMapView];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foundTap:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    tapRecognizer.numberOfTouchesRequired = 1;
    
    [myMapView addGestureRecognizer:tapRecognizer];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
