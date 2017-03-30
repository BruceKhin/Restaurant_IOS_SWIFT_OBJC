//
//  MenuViewController.h
//  Restaurants
//
//  Created by AppsFoundation on 1/20/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,assign) IBOutlet UITableView *menuTableView;

@end
