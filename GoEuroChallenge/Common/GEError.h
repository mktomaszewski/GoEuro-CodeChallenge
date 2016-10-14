//
//  GEError.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEError : NSObject

typedef NS_ENUM(NSUInteger, ParserErrorType) {
  ParserErrorTypeUnknown,
  ParserErrorTypeJSONInvalid,
};

+ (NSError *)parserErrorWithType:(ParserErrorType )type;

@end
