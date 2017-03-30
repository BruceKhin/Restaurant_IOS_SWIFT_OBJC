//
//  FeedbacksManager.m
//  Restaurants
//
//  Created by AppsFoundation on 1/24/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "FeedbacksManager.h"
#import "Feedback.h"

@implementation FeedbacksManager

#pragma mark - Singleton method

+ (FeedbacksManager *)sharedManager {
    static dispatch_once_t predicate = 0;
    static FeedbacksManager *sharedObject;
    
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

#pragma mark - Public methods

- (NSArray *)loadData {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Feedbacks" ofType:@"plist"];
    NSDictionary *dataDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return [self constructDataFromDict:dataDictionary];
}

#pragma mark - Private methods

- (NSArray *)constructDataFromDict:(NSDictionary *)dict {
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSDictionary *obj in [dict allValues]) {
        Feedback *loadedData = [[Feedback alloc] init];
        loadedData.name = obj[@"Name"];
        loadedData.text = obj[@"Text"];
        loadedData.numberOfStars = obj[@"NumberOfStars"];
        [resultArray addObject:loadedData];
    }
    
    return [NSArray arrayWithArray:resultArray];
}


@end
