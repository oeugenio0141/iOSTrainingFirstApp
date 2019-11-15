//
//  IndexViewController.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 14/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "IndexViewController.h"
#import "../Views/IndexView.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.indexView = (IndexView *)[[[NSBundle mainBundle] loadNibNamed:@"IndexView" owner:self options:nil] objectAtIndex:0];
    
    [self.view addSubview:self.indexView];

    self.indexView.proceedDelegate = self;
    
    //Fix frame
    self.indexView.frame = self.view.bounds;
    self.indexView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    
}


- (void)didTapProceedButton{
    
    [self performSegueWithIdentifier:@"mainTabBarSegue" sender:self];
    
}


@end


