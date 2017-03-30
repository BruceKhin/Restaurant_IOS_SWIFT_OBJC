//
//  MenuItem.h
//  Restaurants
//
//  Created by AppsFoundation on 1/21/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *ingredients;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *discount;

@end