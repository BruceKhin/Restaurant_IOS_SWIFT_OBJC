//
//  Feedback.h
//  Restaurants
//
//  Created by AppsFoundation on 1/24/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feedback : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSNumber *numberOfStars;

@end
