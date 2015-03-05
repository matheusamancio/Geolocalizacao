//
//  ListaUsuario.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "ListaUsuario.h"
#import "Usuario.h"

@implementation ListaUsuario

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken = 0;
    
    __strong static ListaUsuario *instance = nil;
    
    dispatch_once(&onceToken,^{
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

- (void)addObjects {
    _usuarios = [[NSMutableArray alloc] init];
    Usuario *usuario = [[Usuario alloc] initWithNome:@"Kaique Pantosi" eIdade:@"20" eTelefone:@"941083040" ePais:@"Brasil" eFoto:@"kaique" eDescricao:@"Oi eu sou o goku" eUsuario:@"KaiqueDamato" eSenha:@"mostarda"];
    [_usuarios addObject:usuario];
}

- (void)addUsers:(Usuario *)usuario {
    [_usuarios addObject:usuario];
}

- (BOOL)confereUsuario:(NSString *)usuario eSenha:(NSString *)senha {
    _index = -1;
    
    for (Usuario *u in _usuarios) {
        _index++;
        if ([u.usuario isEqualToString:usuario] && [u.senha isEqualToString:senha]) {
            return YES;
        }
    }
    return NO;
}

@end
