//
//  AppSettings.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//


#import "AppSettings.h"

NSString *const kUsernameKey = @"username";

//const NSString *kUsernameKey = @"username";

@implementation AppSettings

+ (instancetype)shared{
    static AppSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}


- (void)setUsername:(NSString *)username{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
   
    [userDefaults setValue:username forKey:@"username"];
    
    //[[NSUserDefaults standardUserDefaults] setObject:username forKey:kUsernameKey];
    
}

- (NSString *)getUsername{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults objectForKey:@"username"];
}


- (void)clearUsername {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kUsernameKey];
}
@end
