//
//  TodayViewController.h
//  RestaurantWidget
//
//  Created by AppsFoundation on 23/09/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,assign) IBOutlet UITableView *tableView;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *tableViewHeightConstraint;

@end
