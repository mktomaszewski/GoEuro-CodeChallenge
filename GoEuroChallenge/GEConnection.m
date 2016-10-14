//
//  GEConnection.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "GEConnection.h"
#import "NSDictionary+Validation.h"
#import "EGDateFormatter.h"

@interface GEConnection()

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, strong) NSDate *departureDate;
@property (nonatomic, strong) NSDate *arrivalDate;
@property (nonatomic)         NSInteger numberOfStops;
@property (nonatomic) NSString *imageUrlString;
@property (nonatomic) CGFloat price;
@end

@implementation GEConnection

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
  if (self = [super init]) {
    _identifier = [dict ge_stringForKey:@"id"];
    _departureDate = [[EGDateFormatter timeDateFormatter] dateFromString:[dict ge_stringForKey:@"departure_time"]];
    _arrivalDate = [[EGDateFormatter timeDateFormatter] dateFromString:[dict ge_stringForKey:@"arrival_time"]];
    
    _imageUrlString = [dict ge_stringForKey:@"provider_logo"];
    _numberOfStops = [dict ge_integerForKey:@"number_of_stops"];
    _price = [dict ge_floatForKey:@"price_in_euros"];
  }
  return self;
}
- (NSString *)priceString
{
  return [NSString stringWithFormat:@"%.2f€",self.price];
}

- (NSString *)departureTimeString
{
  return [[EGDateFormatter timeDateFormatter] stringFromDate:self.departureDate];
}

- (NSString *)arrivalTimeString
{
  NSString *suffix = [self arrivalIsNextDay] ? @"(+1)" : @"";
  
  NSString *timeString = [[EGDateFormatter timeDateFormatter] stringFromDate:self.arrivalDate];
  
  return [NSString stringWithFormat:@"%@ %@",timeString, suffix];
}

- (NSString *)timeString
{
  return [NSString stringWithFormat:@"%@ - %@",[self departureTimeString], [self arrivalTimeString]];
}

- (NSString *)durationTimeString
{
  NSTimeInterval interval = [self.arrivalDate timeIntervalSinceDate:self.departureDate];

  
  if ([self arrivalIsNextDay]) {

    interval += 24 * 3600;
  }
  
  NSInteger hours = (NSInteger)interval/3600;
  NSInteger minutes = (NSInteger)(interval/60) % 60;
  
  return [NSString stringWithFormat:@"%ld:%ldh",hours, minutes];
  
}
//TODO: Check for midnight to midnight case
- (BOOL)arrivalIsNextDay
{
  return [self.arrivalDate compare:self.departureDate] == (NSOrderedDescending | NSOrderedSame);
}




@end


