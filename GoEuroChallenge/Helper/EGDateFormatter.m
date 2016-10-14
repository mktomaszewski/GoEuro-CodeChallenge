//
//  EGDateFormatter.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "EGDateFormatter.h"

@implementation EGDateFormatter

+ (EGDateFormatter *)sharedInstance
{
  // 1
  static EGDateFormatter *_sharedInstance = nil;
  
  // 2
  static dispatch_once_t oncePredicate;
  
  // 3
  dispatch_once(&oncePredicate, ^{
    _sharedInstance = [[EGDateFormatter alloc] init];
  });
  return _sharedInstance;
}

+ (EGDateFormatter *)timeDateFormatter
{
  EGDateFormatter *formatter = [self.class sharedInstance];
  [formatter setDateFormat:@"HH:mm"];
  return formatter;
}
@end
