//
//  ListaUsuario.h
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Usuario;

@interface ListaUsuario : NSObject

@property NSMutableArray *usuarios;
@property NSInteger index;

+ (ListaUsuario *)sharedInstance;
- (void)addObjects;
- (void)addUsers:(Usuario *)usuario;
- (BOOL)confereUsuario:(NSString *)usuario eSenha:(NSString *)senha;

@end
