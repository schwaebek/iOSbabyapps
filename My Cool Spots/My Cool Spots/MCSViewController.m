//
//  MCSViewController.m
//  My Cool Spots
//
//  Created by Katlyn Schwaebe on 8/18/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "MCSViewController.h"
#import <MapKit/MapKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MCSAnnotation.h"
#import "MCSTableViewController.h"

@interface MCSViewController () <CLLocationManagerDelegate,MKMapViewDelegate>

@end

@implementation MCSViewController
{
    MKMapView * mymapView;
    CLLocationManager * locationManager;
    

    MCSTableViewController * myCoolSpotsTVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 250.0, 50.0)];
    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4^2"]];
    [self.view addSubview:headerView];
    
    
    myCoolSpotsTVC = [[MCSTableViewController alloc] init];
    myCoolSpotsTVC.tableView.frame = CGRectMake(0, 310, SCREEN_WIDTH, SCREEN_HEIGHT -200);
    [self.view addSubview:myCoolSpotsTVC.tableView];
    [self addChildViewController:myCoolSpotsTVC];
    
    mymapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    mymapView.showsUserLocation = YES;
    mymapView.delegate = self;
    //[mapView setUserTrackingMode = YES animated:YES];
    [self.view addSubview:mymapView];
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation * location in locations)
    {
        NSLog(@"%f %f", location.coordinate.latitude, location.coordinate.longitude);
        // call foursquare request and create annotations for each venue
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        [mymapView setRegion:region animated: YES];
        for (int i = 0; i < 10; i++)
        {
            MCSAnnotation * annotation = [[MCSAnnotation alloc] init];
            
            float randomLat = (arc4random_uniform(100)- 50.0) / 100.0 + location.coordinate.latitude;
            float randomLong = (arc4random_uniform(100)- 50.0) / 100.0 + location.coordinate.longitude;
            
            CLLocationCoordinate2D randomCoordinate = CLLocationCoordinate2DMake(randomLat, randomLong);
            

            [annotation setCoordinate: randomCoordinate];
            CLGeocoder * geocoder = [[CLGeocoder alloc]init];
            CLLocation * randomLocation = [[CLLocation alloc] initWithLatitude:randomCoordinate.latitude longitude:randomCoordinate.longitude];
          
            
            [geocoder reverseGeocodeLocation:randomLocation completionHandler:^(NSArray *placemarks, NSError *error) {
             
                for (CLPlacemark * placemark in placemarks)
                {
                    NSLog(@"%@",placemark.addressDictionary);
                    [annotation setTitle:placemark.addressDictionary[@"City"]];
                }
                
            }];
            [annotation setTitle:@"Title"];
            [mymapView addAnnotation:annotation];
        }
        
    }
    [locationManager stopUpdatingLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(MKAnnotationView *)mapView:(MKMapView *) mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MCSAnnotation * ann = annotation;
    if(mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
    {
        
    } else {
        MKPinAnnotationView * annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
        
        NSLog(@"annotationView");
        
        annotationView.draggable = YES;
        //int randomMarker = arc4random_uniform(2);
        
        NSArray * markers = @[
                              [UIImage imageNamed:@"pin-green-1"],
                              [UIImage imageNamed:@"pin-yellow-1"],
                              [UIImage imageNamed:@"pin-magenta-1"],
                              ];
        
        int randomMarker = arc4random_uniform((int)markers.count);
        annotationView.image = markers[randomMarker];
        annotationView.canShowCallout = YES;
        UIButton * rightCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightCallout addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = rightCallout;
        return annotationView;
    }
    
    return nil;
}


-(void)showDetailVC
{

    UIViewController * detailVC = [[UIViewController alloc] init];
    detailVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
