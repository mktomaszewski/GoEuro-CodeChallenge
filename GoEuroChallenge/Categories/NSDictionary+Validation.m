//
//  NSDictionary+Validation.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "NSDictionary+Validation.h"


@implementation NSDictionary (Validation)

- (id)ge_objectForKey:(NSString *)key
{
  id object = [self objectForKey:key];
  if (object == [NSNull null]) {
    return nil;
  }
  return object;
}

- (NSString *)ge_stringForKey:(NSString *)key
{
  NSString *string = [self ge_objectForKey:key];
  if ([string isKindOfClass:[NSString class]] && string.length > 0) {
    return string;
  }
  return nil;
}

- (NSInteger)ge_integerForKey:(NSString *)key
{
  return [[self ge_objectForKey:key] integerValue];
}

- (CGFloat)ge_floatForKey:(NSString *)key
{
  return [[self ge_objectForKey:key] floatValue];
}


@end
