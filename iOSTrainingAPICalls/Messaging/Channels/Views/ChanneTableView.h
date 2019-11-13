//
//  ChanneTableView.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cells/ChannelTableViewCell.h"

@protocol ChannelDelegate <NSObject>

@required

- (void)didTapAddChannelButton;
- (void)didTapChannelsBackButton;

@end

NS_ASSUME_NONNULL_BEGIN


@interface ChanneTableView : UIView
@property (weak, nonatomic) IBOutlet UITableView *channelTableView;
@property (weak, nonatomic) IBOutlet UIButton *addChannelButton;
@property (weak, nonatomic) IBOutlet UIButton *channelBackButton;


- (IBAction)didTapChannelsBackButton:(id)sender;

- (IBAction)addChannelButton:(id)sender;


@property (strong, nonatomic) id<ChannelDelegate> channelDelegate;

@end

NS_ASSUME_NONNULL_END
