//
//  InfoViewController.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/5/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListaUsuario.h"
#import "Usuario.h"

@interface InfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagemView;
@property (weak, nonatomic) IBOutlet UILabel *nomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *idadeLabel;
@property (weak, nonatomic) IBOutlet UILabel *telefoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *paisLabel;
@property (weak, nonatomic) IBOutlet UILabel *enderecoLabel;
@property (weak, nonatomic) IBOutlet UITextView *descricaoTextView;
@property ListaUsuario *usuarios;

- (IBAction)buttonVoltar:(id)sender;

@end
