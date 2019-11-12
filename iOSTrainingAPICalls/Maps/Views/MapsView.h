//
//  MapsView.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 11/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>


NS_ASSUME_NONNULL_BEGIN

@interface MapsView : UIView
@property (weak, nonatomic) IBOutlet GMSMapView *googleMapView;


@end

NS_ASSUME_NONNULL_END
