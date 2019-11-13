//
//  MessageModel.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <JSQMessage.h>
#import <Foundation/Foundation.h>
#import "DatabasePresentation.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageModel : JSQMessage <DatabasePresentation>


//@property NSString * senderId;
//@property NSString * senderDisplayName;
//@property NSDate * date;
//@property NSString * text;

+ (instancetype)initWith:(NSString *)senderId senderDisplayName:(NSString *)senderName date:(NSDate *)date text:(NSString *)text;





//+ (instancetype)initWith:(NSString *)channelName {
//    ChannelModel * channel = [[ChannelModel alloc] init];
//    channel.channelName = channelName;
//    return channel;
//}
@end

NS_ASSUME_NONNULL_END
