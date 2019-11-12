//
//  ChannelsViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 12/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ChannelsViewController.h"

@interface ChannelsViewController ()

@end

@implementation ChannelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.channelTableViewContainer = (ChanneTableView *)[[[NSBundle mainBundle] loadNibNamed:@"ChannelTableView" owner:self options:nil] objectAtIndex:0];
    
    self.channelTableViewContainer.channelTableView.delegate = self;
    self.channelTableViewContainer.channelTableView.dataSource = self;
    


}

//self.homeView = (HomeView *)[[[NSBundle mainBundle] loadNibNamed:@"HomeView" owner:self options:nil] objectAtIndex:0];
//self.homeView.homeTableView.delegate = self;
//self.homeView.homeTableView.dataSource = self;
//self.homeView.frame = self.view.bounds;
//self.homeView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//[self.view addSubview:self.homeView];
//[self.homeView.homeActivityIndicator startAnimating];
//self.navigationItem.title = @"Categories";
//[self.homeView.homeTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"homeCell"];

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
