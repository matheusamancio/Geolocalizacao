//
//  PerfilViewController.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "PerfilViewController.h"

@interface PerfilViewController ()

@end

@implementation PerfilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _usuarios = [ListaUsuario sharedInstance];
    _fotoView.image = [UIImage imageNamed:[_usuarios.usuarios[_usuarios.index] foto]];
    _nomeLabel.text = [_usuarios.usuarios[_usuarios.index] nome];
    _idadeLabel.text = [_usuarios.usuarios[_usuarios.index] idade];
    _telefoneLabel.text = [_usuarios.usuarios[_usuarios.index] telefone];
    _paisLabel.text = [_usuarios.usuarios[_usuarios.index] pais];
    _descricaoTextView.text = [_usuarios.usuarios[_usuarios.index] descricao];
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)botaoLogoff:(id)sender {
    [self performSegueWithIdentifier:@"showLogin" sender:self];
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
