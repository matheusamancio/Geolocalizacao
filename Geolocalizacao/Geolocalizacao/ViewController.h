//
//  ViewController.h
//  Geolocalizacao
//
//  Created by Matheus Amancio Seixeiro on 3/2/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CoreLocation/CoreLocation.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    BOOL atualizacao;
    MKCoordinateRegion region;
}
@property CLLocationManager * locationManager;


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)currentLocation:(id)sender;


@end

