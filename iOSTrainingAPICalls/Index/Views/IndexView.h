//
//  IndexView.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 14/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProceedDelegate <NSObject>

- (void)didTapProceedButton;

@end


NS_ASSUME_NONNULL_BEGIN

@interface IndexView : UIView
@property (weak, nonatomic) IBOutlet UIButton *proceedButton;

@property (strong, nonatomic) id<ProceedDelegate> proceedDelegate;


@end

NS_ASSUME_NONNULL_END
