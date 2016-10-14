//
//  GEConnectionDataProvider.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "GEConnectionDataProvider.h"
#import "GEHTTPClient.h"
#import "GEConnectionJSONParser.h"

@interface GEConnectionDataProvider()

@property (nonatomic, copy)NSString *hostUrlString;
@property (nonatomic, strong)GEConnectionJSONParser *jsonParser;

@end

@implementation GEConnectionDataProvider

- (instancetype)initWithHostString:(NSString *)hostString
{
  if (self = [super init]) {
    _hostUrlString = hostString;
    _jsonParser = [[GEConnectionJSONParser alloc] init];
  }
  return self;
}

- (void)getConnectionsOnCompletion:(ConnectionReturnBlock) completionBlock
{
  __weak __typeof__(self) weakSelf = self;
  [[GEHTTPClient sharedClient] GET:_hostUrlString parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id  _Nullable JSON) {
    NSError *parserError = nil;
    NSArray *connectionsArray = [weakSelf.jsonParser connectionArrayFromJSON:JSON error:&parserError];
    
    if (parserError) {
      completionBlock(nil, parserError);
      return;
    }
    completionBlock(connectionsArray, nil);

  } failure:^(NSURLSessionDataTask * __unused task, NSError * _Nonnull error) {
    completionBlock(nil, error);
  }];
}
@end
