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
@property FIRCollectionReference * channelRef;
@property ChannelModel * channel;



@end

@implementation ChatViewController



+ (instancetype)initWithChannel:(ChannelModel *)channel{
    ChatViewController * instance = [[ChatViewController alloc] initWithNibName:nil bundle:nil];
    instance.channel = channel;
    return instance;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setupInterface{
    
}

- (void)setUp {
    
    _firestoreDb = [FIRFirestore firestore];
    NSString *stringUrl = [NSString stringWithFormat:@"channel/%@/thread", _channel.channelId];
    //NSString *stringUrl = [NSString stringWithFormat:@"channels/%@/thread", _channel.channelId];
    _channelRef = [_firestoreDb collectionWithPath:stringUrl];
    [_channelRef addSnapshotListener:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        
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
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)handleThreadListener:(FIRDocumentChange *) changes{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
