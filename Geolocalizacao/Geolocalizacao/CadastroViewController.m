//
//  CadastroViewController.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/4/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "CadastroViewController.h"

@interface CadastroViewController ()
@property (weak, nonatomic) IBOutlet UIButton *atributosEscolheFoto;

@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _descricaoTextView.layer.borderColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)escolheFoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [sender setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imagem.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([_imagem isOpaque]) {
        UIColor *color = [_atributosEscolheFoto tintColor];;
        [_atributosEscolheFoto setTitleColor:color forState:UIControlStateNormal];
    }
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)botaoCancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)saveImage: (UIImage *)image {
    NSString *path;
    if (image != nil)
    {
        path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                   NSUserDomainMask, YES)[0];
        path = [path stringByAppendingPathComponent:
                [NSString stringWithFormat:@"%@.png",
                 _nomeUsuario.text]];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
    return path;
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
