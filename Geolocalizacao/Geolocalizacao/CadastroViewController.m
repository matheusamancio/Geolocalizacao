//
//  CadastroViewController.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "CadastroViewController.h"

@interface CadastroViewController ()

@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _descricaoTextView.layer.borderColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
    
    _usuarios = [ListaUsuario sharedInstance];
    
    _nomeTextField.delegate = self;
    _idadeTextField.delegate = self;
    _telefoneTextField.delegate = self;
    _paisTextField.delegate = self;
    _descricaoTextView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchUpView)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.2 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y-200);
    }];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y+200);
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    if (textField == _nomeTextField) {
        [_idadeTextField becomeFirstResponder];
    } else if (textField == _idadeTextField) {
        [_telefoneTextField becomeFirstResponder];
    } else if (textField == _telefoneTextField) {
        [_paisTextField becomeFirstResponder];
    } else if (textField == _paisTextField) {
        [_descricaoTextView becomeFirstResponder];
    } else {
        [self disablesAutomaticKeyboardDismissal];
    }
    
    return YES;
}


- (void)didTouchUpView {
    if ([_nomeTextField isFirstResponder]) {
        [_nomeTextField resignFirstResponder];
    } else if ([_idadeTextField isFirstResponder]) {
        [_idadeTextField resignFirstResponder];
    } else if ([_telefoneTextField isFirstResponder]) {
        [_telefoneTextField resignFirstResponder];
    } else if ([_paisTextField isFirstResponder]) {
        [_paisTextField resignFirstResponder];
    } else if ([_descricaoTextView isFirstResponder]) {
        [_descricaoTextView resignFirstResponder];
    } else if ([_usuarioTextField isFirstResponder]) {
        [_usuarioTextField resignFirstResponder];
    }else if([_senhaTextField isFirstResponder])
        {
            [_senhaTextField resignFirstResponder];
        }
    
}

- (IBAction)escolheFoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [sender setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    _imagemImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([_imagemImageView isOpaque]) {
        UIColor *color = [_botaoEscolheFoto tintColor];;
        [_botaoEscolheFoto setTitleColor:color forState:UIControlStateNormal];
    }
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (NSString *)saveImage: (UIImage *)image {
    NSString *path;
    if (image != nil)
    {
        path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                   NSUserDomainMask, YES)[0];
        path = [path stringByAppendingPathComponent:
                [NSString stringWithFormat:@"%@.png",
                 _nomeTextField.text]];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
    return path;
}

- (IBAction)botaoConfirmar:(id)sender {
    if (![_nomeTextField.text isEqualToString:@""] && ![_idadeTextField.text isEqualToString:@""] && ![_telefoneTextField.text isEqualToString:@""] && ![_paisTextField.text isEqualToString:@""] && ![_descricaoTextView.text isEqualToString:@""] && _imagemImageView.image && ![_usuarioTextField.text isEqualToString:@""] && ![_senhaTextField.text isEqualToString:@""]) {
        Usuario *usuario = [[Usuario alloc] initWithNome:_nomeTextField.text eIdade:_idadeTextField.text eTelefone:_telefoneTextField.text ePais:_paisTextField.text eFoto:[self saveImage:_imagemImageView.image] eDescricao:_descricaoTextView.text eUsuario:_usuarioTextField.text eSenha:_senhaTextField.text];
        
        [_usuarios addUsers:usuario];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Preencha os campos" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)botaoCancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
