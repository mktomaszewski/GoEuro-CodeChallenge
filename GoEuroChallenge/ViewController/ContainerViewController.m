//
//  ContainerViewController.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "ContainerViewController.h"
#import "TravelListViewController.h"
#import "GEConnectionDataProvider.h"

@interface ContainerViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, strong) UIViewController *selectedViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self initializeViewControllers];
  
}

- (void)initializeViewControllers
{
  
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  
  // Train
  TravelListViewController *trainTravelListViewController = [storyboard instantiateViewControllerWithIdentifier:@"TravelListViewController"];
  
  trainTravelListViewController.dataProvider = [[GEConnectionDataProvider alloc] initWithHostString:@"3zmcy"];
  
  // Bus
  TravelListViewController *busTravelListViewController = [storyboard instantiateViewControllerWithIdentifier:@"TravelListViewController"];
  
  busTravelListViewController.dataProvider = [[GEConnectionDataProvider alloc] initWithHostString:@"37yzm"];
  
  // Flight
  TravelListViewController *flightTravelListViewController = [storyboard instantiateViewControllerWithIdentifier:@"TravelListViewController"];
  
  flightTravelListViewController.dataProvider = [[GEConnectionDataProvider alloc] initWithHostString:@"w60i"];
  
  self.viewControllers = @[trainTravelListViewController, busTravelListViewController, flightTravelListViewController];
  
  [self showViewControllerAtIndex:0];
}

- (void)showViewControllerAtIndex:(NSInteger)index
{

  [self.selectedViewController removeFromParentViewController];
  [self.selectedViewController.view removeFromSuperview];
  
  self.selectedViewController = self.viewControllers[index];
  [self.containerView addSubview:self.selectedViewController.view];
  [self.selectedViewController willMoveToParentViewController:self];
  [self addChildViewController:self.selectedViewController];
  
  [self.selectedViewController didMoveToParentViewController:self];  
}

- (IBAction)didSelectSegmentedControl:(UISegmentedControl *)sender
{
  [self showViewControllerAtIndex:sender.selectedSegmentIndex];
}


@end
