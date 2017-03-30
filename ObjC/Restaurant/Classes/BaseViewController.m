//
//  BaseViewController.m
//  Restaurants
//
//  Created by AppsFoundation on 2/24/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "BaseViewController.h"
#import "MSViewControllerSlidingPanel.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"menu_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(onMenu:)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background"]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.layer.shadowOpacity = 1.0f;
    self.navigationController.navigationBar.layer.shadowRadius = 1.0f;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(1, 1);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - Actions

- (IBAction)onMenu:(id)sender {
    if ([[self slidingPanelController] sideDisplayed] == MSSPSideDisplayedLeft)
        [[self slidingPanelController] closePanel];
    else
        [[self slidingPanelController] openLeftPanel];
}

@end
