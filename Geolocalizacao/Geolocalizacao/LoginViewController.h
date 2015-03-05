//
//  LoginViewController.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListaUsuario.h"
#import "Usuario.h"

@interface LoginViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIButton *singInButton;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *senhaTextField;
@property ListaUsuario *usuarios;


@end
