//
//  ViewController.m
//  Geolocalizacao
//
//  Created by Matheus Amancio Seixeiro on 3/2/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <CLLocationManagerDelegate>
@end



@implementation ViewController
@synthesize worldmap;



- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc]init];
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    

    // Do any additional setup after loading the view, typically from a nib.
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    NSLog(@"%@", [locations lastObject]);
    CLLocationCoordinate2D loc = [[locations lastObject] coordinate];
    MKCoordinateRegion region= MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldmap setRegion: region animated:YES];
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //Tratar o erro
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
