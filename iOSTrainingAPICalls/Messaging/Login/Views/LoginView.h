//
//  LoginView.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginDelegate <NSObject>

@required

- (void)didTapLoginButton;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) id<LoginDelegate> loginDelegate;

@end

NS_ASSUME_NONNULL_END
