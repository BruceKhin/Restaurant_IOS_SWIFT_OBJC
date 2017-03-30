//
//  NumberOfGuestsTableViewCell.m
//  Restaurants
//
//  Created by AppsFoundation on 1/26/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "NumberOfGuestsTableViewCell.h"

static NSUInteger defaultNumberOfGuests = 4;
static NSUInteger minimumGuestsNumber = 1;

@implementation NumberOfGuestsTableViewCell

- (void)awakeFromNib {
    self.numberOfGuests = defaultNumberOfGuests;
    [self updateNumberOfGuestsLabel];
}

#pragma mark - Actions

- (IBAction)decreaseGuestsNumber:(id)sender {
    NSLog(@"Decrease number of guests");
    if (self.numberOfGuests > minimumGuestsNumber) {
        self.numberOfGuests--;
        [self updateNumberOfGuestsLabel];
    }
}

- (IBAction)increaseGuestsNumber:(id)sender {
    NSLog(@"Increase number of guests");
    self.numberOfGuests++;
    [self updateNumberOfGuestsLabel];
}

#pragma mark - Private

- (void)updateNumberOfGuestsLabel {
    self.numberOfGuestsLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.numberOfGuests];
}

@end
