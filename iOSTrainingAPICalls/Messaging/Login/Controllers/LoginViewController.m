//
//  LoginViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "LoginViewController.h"
#import "../../../App Settings/AppSettings.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginView = (LoginView *)[[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:self options:nil] objectAtIndex:0];
    
    self.loginView.frame = self.view.bounds;
    self.loginView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:self.loginView];
    
    self.loginView.loginDelegate = self;
    
}

- (void)didTapLoginButton{
   
    
    [[FIRAuth auth] signInAnonymouslyWithCompletion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        
        NSString *username = self.loginView.loginTextField.text;
        
        [self performSegueWithIdentifier:@"channelSegue" sender:self];
        
        [AppSettings.shared setUsername:username];
        
       

    }];
    
    
    
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
