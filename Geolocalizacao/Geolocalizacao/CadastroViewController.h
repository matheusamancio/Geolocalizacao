//
//  CadastroViewController.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "ListaUsuario.h"

@interface CadastroViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagemImageView;
@property (weak, nonatomic) IBOutlet UIButton *botaoEscolheFoto;
@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *idadeTextField;
@property (weak, nonatomic) IBOutlet UITextField *telefoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *paisTextField;
@property (weak, nonatomic) IBOutlet UITextView *descricaoTextView;
@property (weak, nonatomic) IBOutlet UITextField *usuarioTextField;
@property (weak, nonatomic) IBOutlet UITextField *senhaTextField;
@property ListaUsuario *usuarios;


@end
