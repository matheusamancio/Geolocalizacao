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
#import "ListaUsuario.h"
#import "Usuario.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate>

@property BOOL atualizacao;
@property MKCoordinateRegion region;
@property CLPlacemark *thePlacemark;
@property MKRoute *routeDetails;
@property NSMutableArray *matchingItems;
@property CLLocationManager * locationManager;
@property MKPointAnnotation *pm;
@property NSMutableArray *listaAnnotations;
@property NSMutableArray *listaPlacemarks;
@property ListaUsuario *usuarios;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISearchBar *endereco;
@property (weak, nonatomic) IBOutlet UIButton *localizacaoAtual;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)pinar:(id)sender;
- (void)addPin:(NSString *)endereco;
-(id)addCoordenada;

@end

