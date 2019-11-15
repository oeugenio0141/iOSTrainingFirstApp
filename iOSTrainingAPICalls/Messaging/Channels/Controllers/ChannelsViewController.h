//
//  ChannelsViewController.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Views/ChanneTableView.h"
#import <FirebaseFirestore/FirebaseFirestore.h>
#import <FirebaseStorage/FirebaseStorage.h>
#import "../Models/ChannelModel.h"
#import "../../Chat/Controllers/ChatViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface ChannelsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ChannelDelegate>

@property (strong, nonatomic) ChanneTableView *channelTableViewContainer;
@property (strong, nonatomic) NSArray *sampleData;
@property FIRUser *currentUser;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *didTapAddNewChannelButton;

- (IBAction)didTapAddButton:(id)sender;
- (IBAction)didTapSignOut:(id)sender;

//Firebase
//@property (strong, nonatomic) FIRStorageReference *ref;


@end

NS_ASSUME_NONNULL_END
