//
//  DataManager.h
//  RestaurantWidget
//
//  Created by AppsFoundation on 23/09/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@interface MenuItemsManager : NSObject

+ (MenuItemsManager *)sharedManager;
- (NSArray *)loadData;

@end