//
//  ChanneTableView.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ChanneTableView.h"

@implementation ChanneTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)didTapChannelsBackButton:(id)sender {
    
    if (self.channelDelegate && [self.channelDelegate respondsToSelector:@selector(didTapChannelsBackButton)]){
        [self.channelDelegate didTapChannelsBackButton];
    }
    
}

- (IBAction)addChannelButton:(id)sender {
    
    if (self.channelDelegate && [self.channelDelegate respondsToSelector:@selector(didTapAddChannelButton)]){
        [self.channelDelegate didTapAddChannelButton];
    }
    
    
}
@end
