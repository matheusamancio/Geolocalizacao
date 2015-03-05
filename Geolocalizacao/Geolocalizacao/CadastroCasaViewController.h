//
//  CadastroCasaViewController.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/5/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListaUsuario.h"
#import "Usuario.h"

@interface CadastroCasaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *enderecoTextField;
@property ListaUsuario *usuarios;

@end
