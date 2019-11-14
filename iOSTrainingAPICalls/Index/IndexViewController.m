//
//  IndexViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 14/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)didTapProceed:(id)sender {
    
     [self performSegueWithIdentifier:@"mainTabBarSegue" sender:self];
    
}
@end
