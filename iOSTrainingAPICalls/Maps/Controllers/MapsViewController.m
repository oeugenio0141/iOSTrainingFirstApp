//
//  MapsViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 11/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "MapsViewController.h"
#import "../Views/MapsView.h"
//#import "../../Restaurants/Models/Restaurants.h"
#import "../../Restaurants/Controllers/RestaurantsViewController.h"

@interface MapsViewController ()

@end

const float zoom = 15.0f;

@implementation MapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapsViewContainer = (MapsView *)[[[NSBundle mainBundle] loadNibNamed:@"MapsView" owner:self options:nil] objectAtIndex:0];
    
    self.mapsViewContainer.frame = self.view.bounds;
    
    self.mapsViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:self.mapsViewContainer];
    
    self.navigationItem.title = @"Maps";
    
    [self settingUpMap];
    [self initLocationServices];
    
}

- (IBAction)didTapMapBackButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)initLocationServices {
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //[_locationManager requestLocation];
        [_locationManager startUpdatingLocation];
    }
}


- (void)showTitle:(NSString *) title withMessage:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}


- (void)centerToLocation:(CLLocation *)location{

    GMSCameraPosition *camera = [GMSMutableCameraPosition cameraWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude zoom:zoom];
    
    //self.mapsViewContainer.googleMapView.myLocationEnabled = YES;
    self.mapsViewContainer.googleMapView.camera = camera;
    
}

- (void)settingUpMap {
    
    CLLocationCoordinate2D restaurantLocation;
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:restaurantLocation.latitude longitude:restaurantLocation.longitude];
    
    GMSCameraPosition *camera = [[GMSCameraPosition alloc] initWithLatitude:-33.86 longitude:151.20 zoom:zoom];
    self.mapsViewContainer.googleMapView.camera = camera;
    
    self.mapsViewContainer.googleMapView.myLocationEnabled = YES;
    
    [self centerToLocation:location];
    
   

    for (Restaurants *restaurant in self.restaurants) {
        CLLocationCoordinate2D restoLocation;
        restoLocation.latitude = [restaurant.restaurantLatitude floatValue];
        restoLocation.longitude = [restaurant.restaurantLongitude floatValue];
        

        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = restoLocation;
        marker.title = restaurant.restaurantName;
        marker.snippet = @"Snippet";
        marker.map = self.mapsViewContainer.googleMapView;
        
        
        CLLocationCoordinate2D restaurantLocation;
        restaurantLocation.latitude = 14.2190864;
        restaurantLocation.longitude = 121.0449656;
        
        
        CLLocation *location = [[CLLocation alloc] initWithLatitude:restaurantLocation.latitude longitude:restaurantLocation.longitude];
        
        [self centerToLocation:location];

        

    }
    

}

@end
