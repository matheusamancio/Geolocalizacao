//
//  Usuario.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Usuario : NSObject

@property NSString *nome;
@property NSString *idade;
@property NSString *telefone;
@property NSString *pais;
@property NSString *foto;
@property NSString *descricao;
@property NSString *usuario;
@property NSString *senha;
@property NSString *endereco;

- (instancetype)initWithNome:(NSString *)nome eIdade:(NSString *)idade eTelefone:(NSString *)telefone ePais:(NSString *)pais eFoto:(NSString *)foto eDescricao:(NSString *)descricao eUsuario:(NSString *)usuario eSenha:(NSString *)senha;

@end
