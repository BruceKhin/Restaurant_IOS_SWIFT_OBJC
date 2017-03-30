//
//  DataManager.h
//  Restaurants
//
//  Created by AppsFoundation on 1/19/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@interface MenuItemsManager : NSObject

+ (MenuItemsManager *)sharedManager;
- (NSArray *)loadData;

@end