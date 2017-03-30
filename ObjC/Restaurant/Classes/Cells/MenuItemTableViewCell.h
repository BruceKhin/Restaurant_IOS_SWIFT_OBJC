//
//  MenuItemTableViewCell.h
//  Restaurants
//
//  Created by AppsFoundation on 1/21/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItemTableViewCell : UITableViewCell

@property (nonatomic,assign) IBOutlet UILabel *menuItemNameLabel;
@property (nonatomic,assign) IBOutlet UILabel *priceItemLabel;
@property (nonatomic,assign) IBOutlet UILabel *ingredientsItemLabel;
@property (nonatomic,assign) IBOutlet UIImageView *menuItemImageView;
@property (nonatomic,assign) IBOutlet UIView *discountView;
@property (nonatomic,assign) IBOutlet UILabel *discountLabel;

@end