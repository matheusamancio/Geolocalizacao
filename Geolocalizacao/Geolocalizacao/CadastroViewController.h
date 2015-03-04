//
//  CadastroViewController.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastroViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *descricaoTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UITextField *nomeUsuario;

@end
