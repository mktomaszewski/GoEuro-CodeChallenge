//
//  GEConnectionJSONParser.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GEConnection.h"

@interface GEConnectionJSONParser : NSObject


- (NSArray <GEConnection *>*)connectionArrayFromJSON:(id)json error:(NSError **)error;

@end
