//
//  FindUsViewController.h
//  Restaurants
//
//  Created by AppsFoundation on 1/22/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BaseViewController.h"

@interface FindUsViewController : BaseViewController <MKMapViewDelegate>

@property (assign,nonatomic) IBOutlet MKMapView *mapView;
@property (assign,nonatomic) IBOutlet UILabel *locationLabel;
@property (assign,nonatomic) IBOutlet UILabel *distanceLabel;

- (IBAction)onPreviosLocation:(id)sender;
- (IBAction)onNextLocation:(id)sender;
- (IBAction)onMakeReservation:(id)sender;

@end