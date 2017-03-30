//
//  OurMenuViewController.m
//  Restaurants
//
//  Created by AppsFoundation on 1/20/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "OurMenuViewController.h"
#import "MSViewControllerSlidingPanel.h"
#import "MenuItem.h"
#import "MenuItemsManager.h"
#import "MenuItemTableViewCell.h"

@interface OurMenuViewController ()

@property (nonatomic,strong) NSArray *menuItems;

@end

@implementation OurMenuViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuItems = [[MenuItemsManager sharedManager] loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuItemTableViewCell *cell = (MenuItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"menuItemCell"];
    
    MenuItem *item = self.menuItems[indexPath.row];
    
    //display data from MenuItems.plist
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Actions

- (IBAction)onMenu:(id)sender {
    if ([[self slidingPanelController] sideDisplayed] == MSSPSideDisplayedLeft)
        [[self slidingPanelController] closePanel];
    else
        [[self slidingPanelController] openLeftPanel];
}


@end