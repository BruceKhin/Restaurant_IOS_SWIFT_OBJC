//
//  MenuViewController.m
//  Restaurants
//
//  Created by AppsFoundation on 1/20/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "MenuTableViewCell.h"
#import "AppDelegate.h"

typedef enum {
    MenuItemOurItem = 0,
    MenuItemReservation,
    MenuItemFindUs,
    MenuItemFeedback
}MenuItem;

@interface LeftMenuViewController ()

@property (nonatomic,strong) NSArray *menuItems;
@property (nonatomic,strong) NSArray *menuItemsImages;
@property NSInteger selectedMenuItemIndex;

@end

@implementation LeftMenuViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    self.menuItems = @[@"OUR MENU",@"RESERVATION",@"FIND US",@"FEEDBACK"];
    self.menuItemsImages = @[@"our_menu",@"reservation",@"find_us",@"feedback"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = (MenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"menuCell"];
    
    cell.selectedMenuImageView.hidden = (self.selectedMenuItemIndex != indexPath.row);
    cell.itemNameLabel.text = self.menuItems[indexPath.row];
    cell.itemImageView.image = [UIImage imageNamed:self.menuItemsImages[indexPath.row]];
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedMenuItemIndex = indexPath.row;
    
    switch (self.selectedMenuItemIndex) {
        case MenuItemOurItem:
            [[AppDelegate sharedDelegate] openOurMenu];
            break;
        case MenuItemReservation:
            [[AppDelegate sharedDelegate] openReservation];
            break;
        case MenuItemFindUs:
            [[AppDelegate sharedDelegate] openFindUs];
            break;
        case MenuItemFeedback:
            [[AppDelegate sharedDelegate] openFeedback];
            break;
        default:
            break;
    }
    
    [self.menuTableView reloadData];
}

@end