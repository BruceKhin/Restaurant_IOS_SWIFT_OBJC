//
//  NumberOfGuestsTableViewCell.h
//  Restaurants
//
//  Created by AppsFoundation on 1/26/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberOfGuestsTableViewCell : UITableViewCell

@property NSUInteger numberOfGuests;
@property (assign,nonatomic) IBOutlet UILabel *numberOfGuestsLabel;
@property (assign,nonatomic) IBOutlet UILabel *titleLabel;

- (IBAction)decreaseGuestsNumber:(id)sender;
- (IBAction)increaseGuestsNumber:(id)sender;

@end