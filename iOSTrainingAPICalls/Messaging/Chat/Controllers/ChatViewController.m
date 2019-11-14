//
//  ChatViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@property FIRFirestore *firestoreDb;
@property FIRCollectionReference * threadRef;
@property FIRCollectionReference * typingRef;
@property ChannelModel * channel;
@property FIRUser *user;
@property NSMutableArray<MessageModel *> * messages;




@end

@implementation ChatViewController

+ (instancetype)initWithChannel:(ChannelModel *)channel user:(FIRUser *)user{
    ChatViewController * instance = [[ChatViewController alloc] initWithNibName:nil bundle:nil];
    instance.channel = channel;
    instance.user = user;
    instance.messages = [[NSMutableArray alloc] init];
    return instance;
    
}

//+ (instancetype)initWithChannel:(ChannelModel *)channel{
//    ChatViewController * instance = [[ChatViewController alloc] initWithNibName:nil bundle:nil];
//    instance.channel = channel;
//    return instance;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUp];
    [self setupInterface];
    
    
}


- (void)setupInterface{
    self.inputToolbar.delegate = self;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.inputToolbar.contentView.leftBarButtonItem = nil;
}

- (void)setUp {
    
    _firestoreDb = [FIRFirestore firestore];
    NSString *stringUrl = [NSString stringWithFormat:@"channel/%@/thread", _channel.channelId];
    _threadRef = [_firestoreDb collectionWithPath:stringUrl];
    [_threadRef addSnapshotListener:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        
        if (error != nil){
            [self showAlertWith:@"Error" and:error.localizedDescription];
            return;
        }
        for (FIRDocumentChange *change in [snapshot documentChanges]){
             [self handleThreadListener: change];
        }
 
    }];
    
}

- (void)showAlertWith:(NSString *)title and: (NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    [alert addAction:ok];
    [self showViewController:alert sender:nil];
//    [self presentViewController:alert animated:YES completion:nil];
}


- (void)handleThreadListener:(FIRDocumentChange *) change{
    
    MessageModel *msg = [MessageModel initWithDocument:change.document];
    
    if (msg == nil) {
        return;
    }
    
    switch (change.type) {
        case FIRDocumentChangeTypeAdded:
            [_messages addObject:msg];
            [self.collectionView reloadData];
            [self scrollToBottomAnimated:YES];
            break;
        default:
            break;
    }
}


- (BOOL)automaticallyScrollsToMostRecentMessage{
    return YES;
}



//New Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [_messages count];
}

- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  _messages[indexPath.row];
}


//Mark - Bubble

- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapMessageBubbleAtIndexPath:(NSIndexPath *)indexPath{
    MessageModel * msg = _messages[indexPath.row];
    NSLog([NSString stringWithFormat:@"I am tapped: %@", msg.text]);
}

- (id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JSQMessagesAvatarImageFactory *factory = [[JSQMessagesAvatarImageFactory alloc] init];
    MessageModel * msg = _messages[indexPath.row];
    
    NSString * initial = @"";
    if(![msg.senderDisplayName isEqualToString:@""]){
        initial = [[msg.senderDisplayName substringToIndex:1] capitalizedString];
    }
    
    return [factory avatarImageWithUserInitials:initial backgroundColor:UIColor.lightGrayColor textColor:UIColor.whiteColor font:[UIFont systemFontOfSize: 14.f]];
}

- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JSQMessagesBubbleImageFactory * factory = [[JSQMessagesBubbleImageFactory alloc] init];
    
    MessageModel * msg = _messages[indexPath.row];
    
    if([self.senderId isEqualToString:msg.senderId]) {
        return [factory outgoingMessagesBubbleImageWithColor:UIColor.orangeColor];
    }
    return [factory incomingMessagesBubbleImageWithColor:UIColor.lightGrayColor];
}


-(CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath {
    return 15.0f;
    
}

- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath{
    
    return 15.0f;
}

- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageModel * msg = _messages[indexPath.row];
    
    NSString *senderName = msg.senderDisplayName;
    
    return [[NSMutableAttributedString alloc] initWithString:senderName];
    
}

- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageModel * msg = _messages[indexPath.row];
//    FIRTimestamp * date = msg.date;
    
    NSString *formattedDate = @"";
    
    if(msg.date != nil){
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"           yy-MM-dd / HH:mm:ss"];
        
        formattedDate = [dateFormatter stringFromDate:msg.date];
    
    }
    

    return [[NSMutableAttributedString alloc] initWithString:formattedDate];
    
}

- (void)didPressSendButton:(UIButton *)button withMessageText:(NSString *)text senderId:(NSString *)senderId senderDisplayName:(NSString *)senderDisplayName date:(NSDate *)date{
    MessageModel  * msg = [MessageModel messageWithSenderId:senderId displayName:senderDisplayName text:text];
    
    
    [self sendMessage:msg];
    
    self.inputToolbar.contentView.textView.text = @"";
    
    
}

- (void)sendMessage:(MessageModel *)message{
    [_threadRef addDocumentWithData:message.representation completion:^(NSError * _Nullable error) {
        if (error != nil) {
            [self showAlertWith:@"Error" and:@"Failed Sending message"];
        }
    }];
}

- (void)didPressAccessoryButton:(UIButton *)sender{
    
}

- (BOOL)showTypingIndicator{
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    
    
}

//User Details
- (NSString *)senderId{
    return _user.uid;
}

- (NSString *)senderDisplayName{
    return [AppSettings.shared getUsername];
}

@end
