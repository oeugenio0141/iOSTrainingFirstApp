//
//  LoginViewController.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Views/LoginView.h"
#import <FirebaseAuth/FirebaseAuth.h>



NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <LoginDelegate>

@property (strong, nonatomic) LoginView *loginView;
@property (weak, nonatomic) NSString * loginUsername;

@end

NS_ASSUME_NONNULL_END
