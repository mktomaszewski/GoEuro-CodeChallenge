//
//  GEConnectionDataProvider.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GEConnection.h"

typedef void (^ConnectionReturnBlock)(NSArray <GEConnection*> *connectionArray, NSError *error);
@interface GEConnectionDataProvider : NSObject

- (instancetype)initWithHostString:(NSString *)hostString;


- (void)getConnectionsOnCompletion:(ConnectionReturnBlock) completionBlock;
@end
