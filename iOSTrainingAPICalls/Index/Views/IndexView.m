//
//  IndexView.m
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 14/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "IndexView.h"

@implementation IndexView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)didTapProceedButton:(id)sender {
    
    if (self) {
        if (self.proceedDelegate&& [self.proceedDelegate respondsToSelector:@selector(didTapProceedButton)] ) {
            [self.proceedDelegate didTapProceedButton];
        }
    }
}



@end


