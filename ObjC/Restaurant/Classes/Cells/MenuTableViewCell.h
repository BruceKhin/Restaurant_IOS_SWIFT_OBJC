//
//  MenuTableViewCell.h
//  Restaurants
//
//  Created by AppsFoundation on 1/20/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell

@property (nonatomic,assign) IBOutlet UILabel *itemNameLabel;
@property (nonatomic,assign) IBOutlet UIImageView *itemImageView;
@property (nonatomic,assign) IBOutlet UIImageView *selectedMenuImageView;

@end