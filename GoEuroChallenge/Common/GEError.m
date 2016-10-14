//
//  GEError.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "GEError.h"

NSString  *const jsonParserDomain = @"JSONParserDomain";
NSUInteger const jsonParserInvalidJSONCode      = 777;
NSUInteger const jsonParserUnknownCode          = 0;

@implementation GEError

+ (NSError *)parserErrorWithType:(ParserErrorType)type
{
  NSString *description     = @"";
  NSUInteger jsonParserCode = jsonParserUnknownCode;
  
  switch (type) {
    case ParserErrorTypeJSONInvalid:
      description = @"Invalid JSON";
      jsonParserCode = jsonParserInvalidJSONCode;
      break;
    default:
      description = @"Unknown error";
      break;
  }
  
  return [NSError errorWithDomain:jsonParserDomain
                             code:jsonParserCode
                         userInfo:@{NSLocalizedDescriptionKey: description}];
}

@end
