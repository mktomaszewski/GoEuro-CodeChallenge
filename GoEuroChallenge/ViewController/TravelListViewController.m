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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@property (nonatomic) BOOL isLoading;
@property (nonatomic, strong)NSArray *modelArray;

@end

@implementation TravelListViewController

- (void)viewDidLoad
{
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
  self.isLoading = YES;
  __weak __typeof__(self) weakSelf = self;
  [self.dataProvider getConnectionsOnCompletion:^(NSArray<GEConnection *> *connectionArray, NSError *error) {
    weakSelf.isLoading = NO;
    if (error) {
      
    }
    else {
      weakSelf.modelArray = connectionArray;
      NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
      [weakSelf.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }
  }];
}

- (void)setIsLoading:(BOOL)isLoading
{
  _isLoading = isLoading;
  
  self.tableView.alpha = isLoading ? 0.0f : 1.0f;
  isLoading ? [self.loadingIndicator startAnimating] : [self.loadingIndicator stopAnimating];
}

- (void)presentAlert
{
  UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Alert"
                                      message:@"Not implemented yet."
                               preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction* ok = [UIAlertAction
                       actionWithTitle:@"OK"
                       style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action)
                       {
                         [controller dismissViewControllerAnimated:YES completion:nil];
                         
                       }];
  
  [controller addAction:ok];
  
  [self presentViewController:controller animated:YES completion:nil];
  
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self presentAlert];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  [UIView animateWithDuration:0.3 animations:^{
    cell.contentView.alpha = 1.0f;
  }];
}

@end
