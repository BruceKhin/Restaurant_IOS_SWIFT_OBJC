//
//  DataManager.m
//  RestaurantWidget
//
//  Created by AppsFoundation on 23/09/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "MenuItemsManager.h"
#import "MenuItem.h"

@implementation MenuItemsManager

#pragma mark - Singleton method

+ (MenuItemsManager *)sharedManager {
    static dispatch_once_t predicate = 0;
    static MenuItemsManager *sharedObject;

    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

#pragma mark - Public methods

- (NSArray *)loadData {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    NSDictionary *dataDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return [self constructDataFromDict:dataDictionary];
}

#pragma mark - Private methods

- (NSArray *)constructDataFromDict:(NSDictionary *)dict {
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSDictionary *obj in [dict allValues]) {
        MenuItem *loadedData = [[MenuItem alloc] init];
        loadedData.name = obj[@"name"];
        loadedData.image = obj[@"image"];
        loadedData.price = obj[@"price"];
        loadedData.ingredients = obj[@"ingredients"];
        loadedData.discount = obj[@"discount"];
        [resultArray addObject:loadedData];
    }
    
    return [NSArray arrayWithArray:resultArray];
}

@end