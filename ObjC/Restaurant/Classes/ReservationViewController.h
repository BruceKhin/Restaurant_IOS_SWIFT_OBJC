//
//  ReservationViewController.h
//  Restaurants
//
//  Created by AppsFoundation on 1/25/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ReservationViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,assign) IBOutlet UITableView *tableView;

@end
