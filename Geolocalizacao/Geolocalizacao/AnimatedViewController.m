//
//  AnimatedViewController.m
//  Geolocalizacao
//
//  Created by Kaique Damato on 3/5/15.
//  Copyright (c) 2015 Matheus Amancio Seixeiro. All rights reserved.
//

#import "AnimatedViewController.h"
#import "LoginViewController.h"

@interface AnimatedViewController ()

@property (weak,nonatomic) NSTimer *timer;

@end

@implementation AnimatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imagemAnimada.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y-150);
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

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.3
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _imagemAnimada.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y+200);;
                     } completion:^(BOOL finished){
                         [UIView animateWithDuration:0.5
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              _imagemAnimada.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y+90);
                                          } completion:^(BOOL finished){
                                              [UIView animateWithDuration:0.5
                                                                    delay:0.0
                                                                  options:UIViewAnimationOptionCurveEaseIn
                                                               animations:^{
                                                                   _imagemAnimada.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y+200);
                                                                                                                                  }
                                                               completion:^(BOOL finished){
                                                                   _timer = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(nextView) userInfo:nil repeats:NO];
                                                               }];

                                          }];
                     }];
    
    
}

- (void)nextView {
    [self performSegueWithIdentifier:@"showLogIn" sender:self];
    [_timer invalidate];
    _timer = nil;
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
