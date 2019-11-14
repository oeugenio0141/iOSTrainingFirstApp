//
//  TypingModel.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 14/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "TypingModel.h"



@implementation TypingModel

+ (instancetype)initWithDocument:(FIRQueryDocumentSnapshot *)document{
    
    NSDictionary * data = document.data;
    BOOL isTyping = data[@"isTyping"];
    TypingModel * typing = [[TypingModel alloc] init];
    //typing.isTyping = isTyping;

    return typing;
}


+ (instancetype)initWithIsTyping:(Boolean)isTyping{
    TypingModel * typing = [[TypingModel alloc] init];
   // typing.isTyping = isTyping;
    
    return typing;
    
}

- (NSDictionary *)representation{
    
    NSDictionary *data;
    data = @{@"isTyping" : [NSNumber numberWithBool:_isTyping]};
    
    return data;

}
@end
