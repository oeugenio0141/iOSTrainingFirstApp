//
//  TypingModel.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 14/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../Channels/Models/DatabasePresentation.h"

NS_ASSUME_NONNULL_BEGIN

@interface TypingModel : NSObject <DatabasePresentation>

+ (instancetype)initWithDocument:(FIRQueryDocumentSnapshot *)document;

+ (instancetype)initWithIsTyping:(Boolean)isTyping;

@property (readonly) BOOL isTyping;

@end

NS_ASSUME_NONNULL_END
