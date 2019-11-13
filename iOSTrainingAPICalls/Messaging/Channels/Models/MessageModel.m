//
//  MessageModel.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

+ (instancetype)initWithDocument:(FIRQueryDocumentSnapshot *)document{
    
    NSDictionary * data = document.data;
    NSString * senderId = data[@"senderId"];
    NSString * senderName = data[@"senderName"];
    NSDate * date = data[@"date"];
    NSString * text = data[@"text"];
    if (senderId == nil) {
        return nil;
    }
    
  
    MessageModel * message = [[MessageModel alloc] initWithSenderId:senderId senderDisplayName:senderName date:date text:text];
    

    return message;
    
}


- (NSDictionary *)representation{
    NSDictionary *data;
    
    data = @{@"senderId":[self senderId],
             @"senderName":[self senderDisplayName],
             @"date":[self date],
             @"text":[self text]
             };
    
    return data;
}
@end
