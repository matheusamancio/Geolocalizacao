//
//  CadastroTableViewController.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/6/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListaUsuario.h"
#import "Usuario.h"

@interface CadastroTableViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagemImageView;
@property (weak, nonatomic) IBOutlet UIButton *selecionaFotoBotao;
@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *telefoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *idadeTextField;
@property (weak, nonatomic) IBOutlet UITextField *paisTextField;
@property (weak, nonatomic) IBOutlet UITextField *usuarioTextField;
@property (weak, nonatomic) IBOutlet UITextField *senhaTextField;
@property (weak, nonatomic) IBOutlet UITextView *descricaoTextView;
@property ListaUsuario *usuarios;
@property (weak, nonatomic) IBOutlet UIButton *cancelaBotao;
@property (weak, nonatomic) IBOutlet UIButton *confirmaBotao;

@end
