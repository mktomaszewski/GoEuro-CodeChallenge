//
//  GEConnectionTableViewCell.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 14.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "GEConnectionTableViewCell.h"
#import "GEConnection.h"

@import AFNetworking;
@interface GEConnectionTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfStopsLabel;

@end

@implementation GEConnectionTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareForReuse
{
  [super prepareForReuse];
  self.contentView.alpha = 0.0f;
}

- (void)updateWithConnection:(GEConnection *)connection
{
  self.priceLabel.text         = [connection priceString];
  self.durationLabel.text      = [connection durationTimeString];
  self.timeLabel.text          = [connection timeString];
  self.numberOfStopsLabel.text = [connection numberOfStopsString];
  
  NSURL *imageURL = [NSURL URLWithString:[connection imageUrlString]];
  __weak __typeof__(self) weakSelf = self;
  [self.logoImageView setImageWithURLRequest:[NSURLRequest requestWithURL:imageURL] placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
    if ([request.URL isEqual:imageURL]) {
      weakSelf.logoImageView.image = image;
    }
  } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
    
  }];
}

@end
