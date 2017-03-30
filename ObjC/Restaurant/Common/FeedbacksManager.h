//
//  FeedbacksManager.h
//  Restaurants
//
//  Created by AppsFoundation on 1/24/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FeedbacksManager;

@interface FeedbacksManager : NSObject

+ (FeedbacksManager *)sharedManager;
- (NSArray *)loadData;

@end
