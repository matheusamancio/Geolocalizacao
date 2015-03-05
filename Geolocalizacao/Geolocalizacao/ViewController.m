//
//  ViewController.m
//  Geolocalizacao
//
//  Created by Matheus Amancio Seixeiro on 3/2/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *target;

@end

@implementation ViewController {
    bool pesquisouLocations;
    bool pesquisandoLocations;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [[CLLocationManager alloc]init];
    
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager setDelegate:self];
    [_mapView setDelegate:self];
    [_searchBar setDelegate:self];
     _atualizacao = true;
    
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
        _mapView.showsUserLocation = YES;
    }
   
    [_locationManager startUpdatingLocation];
    [_searchBar setClipsToBounds:YES];
    [_searchBar setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    _target.layer.borderWidth = 1.0f;
    pesquisouLocations = NO;
    // Do any additional setup after loading the view, typically from a nib.
}


-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    NSLog(@"%@", [locations lastObject]);
    CLLocationCoordinate2D loc = [[locations lastObject] coordinate];
    _region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    
   
    
    if (_atualizacao) {
        [_mapView setRegion: _region animated:YES];
        _atualizacao = YES;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.locationManager stopUpdatingLocation];
    [self.endereco resignFirstResponder];
    
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //Tratar o erro
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)currentLocation:(id)sender {
    [self.locationManager startUpdatingLocation];
}

- (IBAction)pinar:(id)sender {
    CGPoint point = [sender locationInView:_mapView];
    CLLocationCoordinate2D tapPoint = [_mapView convertPoint:point toCoordinateFromView:self.view];
    CLLocation *loc =[[CLLocation alloc] initWithLatitude:tapPoint.latitude longitude:tapPoint.longitude];
    
    MKPointAnnotation *pm = [[MKPointAnnotation alloc] init];
    
    pm.coordinate = tapPoint;
    [self.mapView removeAnnotations: [_mapView annotations]];
    [self.mapView addAnnotation:pm];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation: loc completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            _thePlacemark = [placemarks lastObject];
            pm.title = _thePlacemark.thoroughfare;
        }
        [_mapView removeOverlays:[_mapView overlays]];
    }];
}



- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation

{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        
        return nil;
    
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    pinView.pinColor = MKPinAnnotationColorRed;
    
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton setTitle:annotation.title forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    pinView.rightCalloutAccessoryView = rightButton;
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnTwo.frame = CGRectMake(0, 0, 40, 40);
    UIImage *btnImage = [UIImage imageNamed:@"garage-25"];
    [btnTwo setImage:btnImage forState:UIControlStateNormal];
    
    
    [btnTwo setTitle:annotation.title forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(rota) forControlEvents:UIControlEventTouchUpInside];
    pinView.leftCalloutAccessoryView = btnTwo;
    
    [btnTwo addTarget:self action:@selector(getRoute) forControlEvents:UIControlEventTouchUpInside];
    
    return pinView;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (_routeDetails!=nil) {
        [self limparRota];
    }
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:_endereco.text completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            _thePlacemark = [placemarks lastObject];
            float spanX = 1.00725;
            float spanY = 1.00725;
            MKCoordinateRegion region2;
            region2.center.latitude = _thePlacemark.location.coordinate.latitude;
            region2.center.longitude = _thePlacemark.location.coordinate.longitude;
            region2.span = MKCoordinateSpanMake(spanX, spanY);
            [_mapView setRegion:region2 animated:YES];
            [self.mapView removeAnnotations: [_mapView annotations]];
            [self addAnnotation:_thePlacemark];
            
        }
        [self getRoute];
    }];
}

- (void)getRoute {
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:_thePlacemark];
    [directionsRequest setSource:[MKMapItem mapItemForCurrentLocation]];
    [directionsRequest setDestination:[[MKMapItem alloc] initWithPlacemark:placemark]];
    directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            _routeDetails = response.routes.lastObject;
            
            [_mapView addOverlay:_routeDetails.polyline level:MKOverlayLevelAboveRoads];
        }
    }];
}

- (void)addAnnotation:(CLPlacemark *)placemark {
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
    point.title = [placemark.addressDictionary objectForKey:@"Street"];
    point.subtitle = [placemark.addressDictionary objectForKey:@"City"];
    [self.mapView addAnnotation:point];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer  * routeLineRenderer = [[MKPolylineRenderer alloc] initWithPolyline:_routeDetails.polyline];
    routeLineRenderer.strokeColor = [UIColor blueColor];
    routeLineRenderer.lineWidth = 5;
    return routeLineRenderer;
}

- (void)rota {
}

- (void)limparRota {
    [self.mapView removeOverlay:_routeDetails.polyline];
}

- (void)showInfo {
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"showInfo"];
    [self presentViewController: viewController animated:YES completion:nil];
}

@end
