//
//  ChatViewController.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <FirebaseAuth/FirebaseAuth.h>
#import <UIKit/UIKit.h>
#import <JSQMessagesViewController/JSQMessagesViewController.h>
#import <JSQMessagesViewController/JSQMessagesBubbleImageFactory.h>
#import <JSQMessagesViewController/JSQMessagesAvatarImageFactory.h>



#import "../../Channels/Models/ChannelModel.h"
#import "../../Channels/Models/MessageModel.h"
#import "../../../App Settings/AppSettings.h"
#import "../Model/TypingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : JSQMessagesViewController <JSQMessagesInputToolbarDelegate, JSQMessagesCollectionViewDataSource>


+ (instancetype)initWithChannel:(ChannelModel *)channel user:(FIRUser *)user;

//+ (instancetype)initWithChannel:(ChannelModel *)channel;



@end

NS_ASSUME_NONNULL_END
