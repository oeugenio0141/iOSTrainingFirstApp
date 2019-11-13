//
//  ChannelModel.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel

+ (instancetype)initWith:(NSString *)channelName {
    ChannelModel * channel = [[ChannelModel alloc] init];
    channel.channelName = channelName;
    return channel;
}

+ (instancetype)initWithDocument:(FIRQueryDocumentSnapshot *)document{
    NSDictionary *data = document.data;
    NSString * name = data[@"name"];
    
    if (name == nil) {
        return nil;
    }
    
    ChannelModel * channel = [ChannelModel initWith:name];
    channel.channelId = [document documentID];
    return channel;
    
}

- (NSDictionary *)representation{
    NSDictionary * retVal;
    retVal = @{ @"name": _channelName};
    return retVal;
}



@end
