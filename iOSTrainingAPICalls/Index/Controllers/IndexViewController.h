//
//  IndexViewController.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 14/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "../Views/IndexView.h"



NS_ASSUME_NONNULL_BEGIN

@interface IndexViewController : UIViewController <ProceedDelegate>

@property (strong, nonatomic) IndexView * indexView;



@end

NS_ASSUME_NONNULL_END
