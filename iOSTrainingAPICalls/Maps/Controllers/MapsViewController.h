//
//  MapsViewController.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 11/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Views/MapsView.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapsViewController : UIViewController <CLLocationManagerDelegate, GMSMapViewDelegate>

@property (strong, nonatomic) MapsView *mapsViewContainer;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *restaurants;



@end

NS_ASSUME_NONNULL_END
