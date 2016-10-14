//
//  ContainerViewController.m
//  GoEuroChallenge
//
//  Created by Michal Tomaszewski on 13.10.2016.
//  Copyright © 2016 Michal Tomaszewski. All rights reserved.
//

#import "ContainerViewController.h"
#import "TravelListViewController.h"

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
  // Train
  
//  TravelListViewController *trainListViewController = 
  
  // Bus
  
  // Flight
}


@end
