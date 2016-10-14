//
//  NSDictionary+Validation.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//
@import CoreGraphics;
#import <Foundation/Foundation.h>

@interface NSDictionary (Validation)

- (NSString *)ge_stringForKey:(NSString *)key;
- (NSInteger)ge_integerForKey:(NSString *)key;
- (CGFloat)ge_floatForKey:(NSString *)key;

- (id)ge_objectForKey:(NSString *)key;
@end
