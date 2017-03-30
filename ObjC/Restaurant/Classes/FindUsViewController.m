//
//  FindUsViewController.m
//  Restaurants
//
//  Created by AppsFoundation on 1/22/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "FindUsViewController.h"
#import "MSViewControllerSlidingPanel.h"

@interface FindUsViewController ()

@end

@implementation FindUsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (IBAction)onPreviosLocation:(id)sender {
    NSLog(@"Previous location");
    
    self.distanceLabel.text = @"2,5 Mi";
    self.locationLabel.text = @"21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200";
}

- (IBAction)onNextLocation:(id)sender {
    NSLog(@"Next location");
    
    self.locationLabel.text = @"21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200";
    self.distanceLabel.text = @"2,5 Mi";
}

- (IBAction)onMakeReservation:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You" message:@"You have booked table. Thanks for your reservation." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}
@end