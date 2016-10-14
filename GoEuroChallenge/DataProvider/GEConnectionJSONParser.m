//
//  GEConnectionJSONParser.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "GEConnectionJSONParser.h"
#import "GEError.h"

@implementation GEConnectionJSONParser


- (NSArray <GEConnection *>*)connectionArrayFromJSON:(id)json error:(NSError **)error
{
  if (!json || ![json isKindOfClass:[NSArray class]]) {
    *error = [GEError parserErrorWithType:ParserErrorTypeJSONInvalid];
    return nil;
  }
  __block NSMutableArray *connectionsArray = [[NSMutableArray alloc] init];
  [json enumerateObjectsUsingBlock:^(id  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
    GEConnection *connection = [[GEConnection alloc] initWithDictionary:dict];
    [connectionsArray addObject:connection];
  }];
  return connectionsArray;
}

@end
