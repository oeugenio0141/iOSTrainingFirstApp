//
//  LoginView.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView



- (IBAction)didTapLoginButton:(id)sender {
    
    if (self) {
        if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(didTapLoginButton)]){
            [self.loginDelegate didTapLoginButton];
        }
    }
    
}


@end
