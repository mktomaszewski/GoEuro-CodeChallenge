//
//  ViewController.h
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GEConnectionDataProvider;

@interface TravelListViewController : UIViewController

@property (nonatomic, strong) GEConnectionDataProvider *dataProvider;

@end

@interface TravelListViewController(TableView) <UITableViewDataSource, UITableViewDelegate>

@end

