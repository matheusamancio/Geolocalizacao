//
//  ViewController.m
//  Geolocalizacao
//
//  Created by Matheus Amancio Seixeiro on 3/2/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [[CLLocationManager alloc]init];
    
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager setDelegate:self];
     atualizacao = true;
    
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
   
    [_locationManager startUpdatingLocation];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    NSLog(@"%@", [locations lastObject]);
    CLLocationCoordinate2D loc = [[locations lastObject] coordinate];
    region= MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    
   
    
    if (atualizacao) {
        [_mapView setRegion: region animated:YES];
        atualizacao = false;
    }
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
    [_mapView setRegion: region animated:YES];
}

- (IBAction)pinar:(id)sender {
    CGPoint point = [sender locationInView:self.mapView];
    
    CLLocationCoordinate2D tapPoint = [self.mapView convertPoint:point toCoordinateFromView:self.view];
    
    MKPointAnnotation *pm = [[MKPointAnnotation alloc] init];
    
    pm.coordinate = tapPoint;
    [self.mapView removeAnnotations: [self.mapView annotations]];
    [self.mapView addAnnotation:pm];
}
@end
