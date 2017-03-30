//
//  ReservationLocationTableViewCell.m
//  Restaurants
//
//  Created by AppsFoundation on 1/25/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "ReservationLocationTableViewCell.h"

@implementation ReservationLocationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Actions

- (IBAction)leftSwipe:(id)sender {
    NSLog(@"Previous location");
    [self previousLocation];
}

- (IBAction)rightSwipe:(id)sender {
    NSLog(@"Next location");
    [self nextLocation];
}

- (IBAction)onPreviosLocation:(id)sender {
    NSLog(@"Previous location");
    [self previousLocation];
    
    self.distanceLabel.text = @"2,5 Mi";
    self.locationLabel.text = @"21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200";
}

- (IBAction)onNextLocation:(id)sender {
    NSLog(@"Next location");
    [self nextLocation];
    
    self.locationLabel.text = @"21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200";
    self.distanceLabel.text = @"2,5 Mi";
}

#pragma mark - Private 

- (void)previousLocation {
    [UIView animateWithDuration:0.2 animations:^(void) {
        self.locationLabel.alpha = 0.0;
    }];
    [UIView animateWithDuration:0.1 animations:^(void) {
        self.locationLabel.alpha = 1.0;
    }];
}

- (void)nextLocation {
    [UIView animateWithDuration:0.2 animations:^(void) {
        self.locationLabel.alpha = 0.0;
    }];
    [UIView animateWithDuration:0.1 animations:^(void) {
        self.locationLabel.alpha = 1.0;
    }];
}

@end