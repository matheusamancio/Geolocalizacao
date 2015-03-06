//
//  CadastroCasaViewController.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/5/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "CadastroCasaViewController.h"

@interface CadastroCasaViewController ()

@end

@implementation CadastroCasaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _usuarios = [ListaUsuario sharedInstance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botaoSalvaEndereco:(id)sender {
    Usuario *usuario = _usuarios.usuarios[_usuarios.index];
    if (![_enderecoTextField.text isEqualToString:@""]) {
        [usuario setEndereco:_enderecoTextField.text];
    }
//    [self dismissViewControllerAnimated:YES completion:nil];
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
