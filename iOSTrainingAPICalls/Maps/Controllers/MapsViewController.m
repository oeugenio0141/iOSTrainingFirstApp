//
//  MapsViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 11/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "MapsViewController.h"

@interface MapsViewController ()

@end

@implementation MapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapsView = (MapsView *)[[[NSBundle mainBundle] loadNibNamed:@"MapsView" owner:self options:nil] objectAtIndex:0];
    
    self.mapsView.frame = self.view.bounds;
    
    self.mapsView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:self.mapsView];
    
    self.navigationItem.title = @"Maps";



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
