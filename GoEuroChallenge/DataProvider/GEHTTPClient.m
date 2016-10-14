//
//  GEHTTPClient.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "GEHTTPClient.h"

static NSString * const baseURLString = @"https://api.myjson.com/bins/";

@implementation GEHTTPClient


+ (instancetype)sharedClient
{
  static GEHTTPClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[GEHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
    _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
  });
  return _sharedClient;
}

@end
