//
//  ChatViewController.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Channels/Models/ChannelModel.h"
#import <JSQMessagesViewController/JSQMessagesViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : JSQMessagesViewController


+ (instancetype)initWithChannel:(ChannelModel *)channel;


@end

NS_ASSUME_NONNULL_END
