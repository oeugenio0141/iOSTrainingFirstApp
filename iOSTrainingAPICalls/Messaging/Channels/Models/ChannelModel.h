//
//  ChannelModel.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "DatabasePresentation.h"
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface ChannelModel : NSObject <DatabasePresentation>

@property (copy, readwrite) NSString *channelName;
@property (copy, readwrite) NSString *channelId;

+ (instancetype) initWith:(NSString *)channelName;

@end

NS_ASSUME_NONNULL_END
