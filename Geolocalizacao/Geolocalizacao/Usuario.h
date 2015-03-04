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
@property NSInteger idade;
@property NSString *telefone;
@property NSString *pais;
@property UIImage *foto;
@property NSString *descricao;

- (instancetype)initWithNome:(NSString *)nome eIdade:(NSInteger)idade eTelefone:(NSString *)telefone ePais:(NSString *)pais eFoto:(UIImage *)foto eDescricao:(NSString *)descricao;

@end
