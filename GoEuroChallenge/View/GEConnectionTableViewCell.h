//
//  GEConnectionTableViewCell.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GEConnection;
@interface GEConnectionTableViewCell : UITableViewCell


- (void)updateWithConnection:(GEConnection *)connection;
@end
