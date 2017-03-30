//
//  ConfigurationManager.h
//  Restaurants
//
//  Created by AppsFoundation on 1/19/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigurationManager : NSObject

@property (nonatomic,readonly,copy) NSString *appId;
@property (nonatomic,readonly,copy) NSString *contactMail;
@property (nonatomic,readonly,copy) NSNumber *rateAppDelay;
@property (nonatomic,readonly,copy) NSString *flurrySessionID;

+ (ConfigurationManager *)sharedManager;

@end
