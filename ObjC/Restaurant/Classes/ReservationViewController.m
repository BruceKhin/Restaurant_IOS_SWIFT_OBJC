//
//  ReservationViewController.m
//  Restaurants
//
//  Created by AppsFoundation on 1/25/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "ReservationViewController.h"

//cells
#import "ReservationLocationTableViewCell.h"
#import "NumberOfGuestsTableViewCell.h"
#import "PhoneNumberTableViewCell.h"
#import "MakeReservationTableViewCell.h"

typedef enum {
    ReservationCellLocation = 0,
    ReservationCellNumberOfGuests,
    ReservationCellPhone,
    ReservationCellMakeReservation,
    ReservationCellCount
}ReservationCell;

@interface ReservationViewController ()

@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ReservationCellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case ReservationCellLocation: {
            ReservationLocationTableViewCell *cell = (ReservationLocationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"reservationCell"];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
        case ReservationCellNumberOfGuests: {
            NumberOfGuestsTableViewCell *cell = (NumberOfGuestsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"numberOfGuestsCell"];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
        case ReservationCellPhone: {
            PhoneNumberTableViewCell *cell = (PhoneNumberTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"phoneNumberCell"];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
        case ReservationCellMakeReservation: {
            MakeReservationTableViewCell *cell = (MakeReservationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"makeReservationCell"];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == ReservationCellMakeReservation) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You" message:@"You have booked table. Thanks for your reservation." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case ReservationCellLocation: {
            return 228.0f;
        }
        case ReservationCellNumberOfGuests: {
            return 140.0f;
        }
        case ReservationCellPhone: {
            return 140.0f;
        }
        case ReservationCellMakeReservation: {
            return 98.0f;
        }
    }
    
    return 0.0f;
}

@end