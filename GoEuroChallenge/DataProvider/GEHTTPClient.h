//
//  GEHTTPClient.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AFNetworking;

@interface GEHTTPClient : AFHTTPSessionManager

+ (instancetype)sharedClient;
@end
