//
//  AppSettings.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//


#import "AppSettings.h"


const NSString *kUsernameKey = @"username";

@implementation AppSettings

+ (instancetype)shared{
    static AppSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}


- (void)setUsername:(NSString *)username{
    
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:kUsernameKey];
   
    
}

- (NSString *)getUsername{
    
    return [NSUserDefaults valueForKey:kUsernameKey];
}

@end
