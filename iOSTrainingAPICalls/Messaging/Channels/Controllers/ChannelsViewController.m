//
//  ChannelsViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ChannelsViewController.h"

@interface ChannelsViewController ()

@property FIRFirestore *firestoreDb;
@property FIRCollectionReference * channelRef;
@property UIAlertController *alertController;
@property NSMutableArray * channels;




@end


NSString * cellIdentifier = @"channelCell";

@implementation ChannelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firestoreDb = [FIRFirestore firestore];
    //_channelRef = [_firestoreDb collectionWithPath:@"channels"];
    _channelRef = [_firestoreDb collectionWithPath:@"channel"];
    
    
    self.channelTableViewContainer = (ChanneTableView *)[[[NSBundle mainBundle] loadNibNamed:@"ChannelTableView" owner:self options:nil] objectAtIndex:0];
    
    self.channelTableViewContainer.frame = self.view.bounds;
    
    self.channelTableViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;

    self.channelTableViewContainer.channelTableView.delegate = self;
    self.channelTableViewContainer.channelTableView.dataSource = self;
    
    [self.view addSubview:self.channelTableViewContainer];
    
    [self.channelTableViewContainer.channelTableView registerNib:[UINib nibWithNibName:@"ChannelTableViewCell" bundle:nil] forCellReuseIdentifier:@"channelCell"];
    
    self.channelTableViewContainer.channelDelegate = self;
    
    [self setUp];
    
    
}

- (void)didTapChannelsBackButton{
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didTapAddChannelButton{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Create Channel" message:@"Input a channel name" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"SAVE" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self didTapSave];
    }];
    
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        
    }];
    
    [alert addAction:ok];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Channel name here";
    }];
    
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    _alertController = alert;
 

}

- (void)didTapSave{
    UITextField * textField = _alertController.textFields[0];
    
    if (textField == nil) {
        return;
    }
    ChannelsViewController *vc = self;
    
    NSString *channelName = textField.text;
    
    ChannelModel *channel = [ChannelModel initWith:channelName];
    [_channelRef addDocumentWithData:[channel representation] completion:^(NSError * _Nullable error){
        NSString * title = @"Success";
        NSString * message = @"Succesfully Add Channel";
        if (error != nil){
            
            message = [NSString stringWithFormat:@"Failed to add channel %@", error.localizedDescription];
        }
        
        [vc showAlertWith:title and:message];
    
        }];
        

    
}


- (void)showAlertWith:(NSString *)title and: (NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)setUp{
    
    _firestoreDb = [FIRFirestore firestore];
    _channelRef = [_firestoreDb collectionWithPath:@"channel"];
    _channels = [[NSMutableArray alloc] init];
    
    [_channelRef addSnapshotListener:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error != nil){
            [self showAlertWith:@"Error" and:error.localizedDescription];
            return;
        }
        for (FIRDocumentChange *change in [snapshot documentChanges]){
            [self handleDocumentChange:change];
        }
    }];
    
}


- (void)handleDocumentChange:(FIRDocumentChange *)change{
    ChannelModel * channel = [ChannelModel initWithDocument:change.document];
    
    if (channel == nil){
        return;
    }
    
    switch (change.type) {
        case FIRDocumentChangeTypeAdded:
            [self addChannelToTable:channel];
            break;
        case FIRDocumentChangeTypeModified:
            [self updateChannelToTable:channel];
            break;
        case FIRDocumentChangeTypeRemoved:
            [self removeChannelToTable:channel];
            break;
        default:
            break;
    }
  
}

- (void)addChannelToTable:(ChannelModel *)channel{
    if ([_channels containsObject:channel]) {
        return;
    }
    [_channels addObject:channel];
    NSInteger index = [_channels count] -1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    NSArray * paths = [NSArray arrayWithObjects:indexPath, nil];
    
    [self.channelTableViewContainer.channelTableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)removeChannelToTable:(ChannelModel *)channel{
//    NSInteger index = [_channels indexOfObjectIdenticalTo:channel];
//
    for (int i=0; i++; [_channels count]) {
        ChannelModel *currentChannel = _channels[i];
        if([channel.channelId isEqualToString:currentChannel.channelId]){
            _channels[i] = channel;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            NSArray * paths = [NSArray arrayWithObjects:indexPath, nil];
            [self.channelTableViewContainer.channelTableView deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
    }

}

- (void)updateChannelToTable:(ChannelModel *)channel{

    for (int i=0; i++; [_channels count]) {
        ChannelModel *currentChannel = _channels[i];
        if([channel.channelId isEqualToString:currentChannel.channelId]){
            _channels[i] = channel;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            NSArray * paths = [NSArray arrayWithObjects:indexPath, nil];
            [self.channelTableViewContainer.channelTableView reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_channels count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChannelTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ChannelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
    }
    
    ChannelModel * channel = _channels[indexPath.row];
    cell.textLabel.text = channel.channelName;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChannelModel *channel = _channels[indexPath.row];
    
    if (channel == nil){
        return;
    }
    
    ChatViewController * vc = [ChatViewController initWithChannel:channel];
    
    if ([self navigationController] != nil) {
        
        [[self navigationController] presentViewController:vc animated:YES completion:nil];
        
    } else{
        
        [self presentViewController:vc animated:YES completion:nil];
        
    }

}

- (void)verifyChannel{
    

    
    
}


@end
