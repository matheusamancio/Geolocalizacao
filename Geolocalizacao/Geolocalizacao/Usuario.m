//
//  Usuario.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

- (instancetype)initWithNome:(NSString *)nome eIdade:(NSInteger)idade eTelefone:(NSString *)telefone ePais:(NSString *)pais eFoto:(UIImage *)foto eDescricao:(NSString *)descricao {
    self = [super init];
    if (self) {
        _nome = nome;
        _idade = idade;
        _telefone = telefone;
        _pais = pais;
        _foto = foto;
        _descricao = descricao;
    }
    return self;
}

@end
