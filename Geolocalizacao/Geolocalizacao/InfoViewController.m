//
//  InfoViewController.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/5/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _usuarios = [ListaUsuario sharedInstance];
    _imagemView.image = [UIImage imageNamed:[_usuarios.usuarios[_usuarios.index] foto]];
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

- (IBAction)buttonVoltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
