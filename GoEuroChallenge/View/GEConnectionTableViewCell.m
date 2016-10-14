//
//  GEConnectionTableViewCell.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "GEConnectionTableViewCell.h"
#import "GEConnection.h"

@interface GEConnectionTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end

@implementation GEConnectionTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)updateWithConnection:(GEConnection *)connection
{
  self.priceLabel.text     = [connection priceString];
  self.durationLabel.text  = [connection durationTimeString];
  self.timeLabel.text      = [connection timeString];
}

@end
