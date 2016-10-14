//
//  ViewController.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "TravelListViewController.h"
#import "GEConnectionDataProvider.h"
#import "GEConnectionTableViewCell.h"

@interface TravelListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) GEConnectionDataProvider *dataProvider;
@property (nonatomic, strong)NSArray *modelArray;
@end

@implementation TravelListViewController



- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self initialize];
  
  [self loadData];
}

- (void)initialize
{
  self.modelArray = [NSArray array];
}

- (void)loadData
{
  __weak __typeof__(self) weakSelf = self;
  [self.dataProvider getConnectionsOnCompletion:^(NSArray<GEConnection *> *connectionArray, NSError *error) {
    
    if (error) {
      
    }
    else {
      weakSelf.modelArray = connectionArray;
      [weakSelf.tableView reloadData];
    }
  }];
}

@end

@implementation TravelListViewController(TableView)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  GEConnectionTableViewCell *cell = (GEConnectionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ConnectionTableViewCell"];
  
  GEConnection *connection = self.modelArray[indexPath.row];
  
  [cell updateWithConnection:connection];
  
  return cell;
}

@end
