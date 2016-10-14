//
//  GEConnection.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

@interface GEConnection : NSObject

@property (nonatomic, copy, readonly) NSString *identifier;

/*
@property (nonatomic, strong, readonly) NSDate *departureDate;
@property (nonatomic, strong, readonly) NSDate *arrivalDate;
@property (nonatomic, readonly)         NSInteger numberOfStops;
@property (nonatomic, copy, readonly) NSString *imageUrlString;
@property (nonatomic, readonly) CGFloat price;
*/

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSString *)timeString;
- (NSString *)durationTimeString;
- (NSString *)priceString;


@end


/*
 
 arrival_time":
 "14:34",
 "departure_time":
 "8:17",
 "id":
 2,
 "number_of_stops":
 2,
 "price_in_euros":
 74.83,
 "provider_logo":
 "http://cdn-goeuro.com/static_content/web/logos/{size}/deutsche_bahn.png"
 
 */
