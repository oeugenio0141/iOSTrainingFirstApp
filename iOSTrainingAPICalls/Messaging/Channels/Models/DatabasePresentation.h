//
//  DatabasePresentation.h
//  iOSTrainingAPICalls
//
//  Created by OPSolutions on 13/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FirebaseFirestore/FirebaseFirestore.h>

#ifndef DatabasePresentation_h
#define DatabasePresentation_h

@protocol DatabasePresentation <NSObject>

- (NSDictionary *)representation;

+ (instancetype)initWithDocument:(FIRQueryDocumentSnapshot *)document;
    


@end



#endif /* DatabasePresentation_h */
