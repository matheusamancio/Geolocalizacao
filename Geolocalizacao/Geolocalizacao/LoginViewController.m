//
//  LoginViewController.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _usuarios = [ListaUsuario sharedInstance];
    [_usuarios addObjects];
    _singInButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _loginButton.layer.borderColor = [[UIColor whiteColor] CGColor];
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

- (IBAction)botaoLogIn:(id)sender {
    if ([_usuarios confereUsuario:_loginTextField.text eSenha:_senhaTextField.text]) {
        [self performSegueWithIdentifier:@"showApp" sender:self];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Usuário ou senha inválidos" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
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
