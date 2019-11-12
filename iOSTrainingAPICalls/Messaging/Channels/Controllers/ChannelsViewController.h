//
//  ChannelsViewController.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Views/ChanneTableView.h"


NS_ASSUME_NONNULL_BEGIN

@interface ChannelsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) ChanneTableView *channelTableViewContainer;


@end

NS_ASSUME_NONNULL_END
