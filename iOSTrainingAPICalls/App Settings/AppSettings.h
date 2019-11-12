//
//  AppSettings.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef AppSettings_h
#define AppSettings_h

const NSString *kUsernameKey = @"username";

@interface AppSettings : NSObject

+ (instancetype)shared;

- (void) setUsername:(NSString *)username;

- (NSString *)getUsername;

@end

#endif /* AppSettings_h */
