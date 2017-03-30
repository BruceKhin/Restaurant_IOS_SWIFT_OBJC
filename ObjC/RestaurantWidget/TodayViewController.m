//
//  TodayViewController.m
//  RestaurantWidget
//
//  Created by AppsFoundation on 23/09/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "MenuItem.h"
#import "MenuItemsManager.h"
#import "MenuItemTableViewCell.h"

static const CGFloat cellRatio = 0.57;

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic,strong) NSArray *menuItems;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems = [[MenuItemsManager sharedManager] loadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuItemTableViewCell *cell = (MenuItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"menuItemCell"];
    MenuItem *item = self.menuItems[indexPath.row];
    
    cell.menuItemNameLabel.text = item.name;
    cell.ingredientsItemLabel.text = item.ingredients;
    cell.priceItemLabel.text = item.price;
    cell.menuItemImageView.image = [UIImage imageNamed:item.image];
    cell.discountLabel.text = item.discount;
    cell.discountLabel.hidden = item.discount == nil;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height =  tableView.bounds.size.width * cellRatio;
    return height;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tableViewHeightConstraint.constant += cell.bounds.size.height;
    [self.tableView needsUpdateConstraints];
}

#pragma mark - NCWidgetProviding

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    defaultMarginInsets.right = defaultMarginInsets.left;
    [self.view needsUpdateConstraints];
    [self.tableView needsUpdateConstraints];
    return defaultMarginInsets;
}

@end
