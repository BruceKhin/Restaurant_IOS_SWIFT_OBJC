//
//  ReservationLocationTableViewCell.h
//  Restaurants
//
//  Created by AppsFoundation on 1/25/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationLocationTableViewCell : UITableViewCell

@property (assign,nonatomic) IBOutlet UILabel *locationLabel;
@property (assign,nonatomic) IBOutlet UILabel *distanceLabel;

- (IBAction)leftSwipe:(id)sender;
- (IBAction)rightSwipe:(id)sender;
- (IBAction)onPreviosLocation:(id)sender;
- (IBAction)onNextLocation:(id)sender;

@end