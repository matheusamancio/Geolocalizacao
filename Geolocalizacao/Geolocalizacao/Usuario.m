//
//  Usuario.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

- (instancetype)initWithNome:(NSString *)nome eIdade:(NSString *)idade eTelefone:(NSString *)telefone ePais:(NSString *)pais eFoto:(NSString *)foto eDescricao:(NSString *)descricao eUsuario:(NSString *)usuario eSenha:(NSString *)senha {
    self = [super init];
    if (self) {
        _nome = nome;
        _idade = idade;
        _telefone = telefone;
        _pais = pais;
        _foto = foto;
        _descricao = descricao;
        _usuario = usuario;
        _senha = senha;
        _index = -1;
    }
    return self;
}

@end
