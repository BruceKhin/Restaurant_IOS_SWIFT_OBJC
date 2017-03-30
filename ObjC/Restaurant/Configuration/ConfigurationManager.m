//
//  ConfigurationManager.m
//  Restaurants
//
//  Created by AppsFoundation on 1/19/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "ConfigurationManager.h"

@interface ConfigurationManager ()

@property (nonatomic,readwrite,copy) NSString *appId;
@property (nonatomic,readwrite,copy) NSString *contactMail;
@property (nonatomic,readwrite,copy) NSNumber *rateAppDelay;
@property (nonatomic,readwrite,copy) NSString *flurrySessionID;

@end

@implementation ConfigurationManager

#pragma mark - Singleton method

+ (ConfigurationManager *)sharedManager {
    static dispatch_once_t predicate = 0;
    static ConfigurationManager *sharedObject;
    
    dispatch_once(&predicate, ^{
        //initializing singleton object
        sharedObject = [[self alloc] init];
        
        //load data from Configuration.plist
        [sharedObject loadData];
    });
    return sharedObject;
}

#pragma mark - Private methods

- (void)loadData {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Configuration" ofType:@"plist"];
    NSDictionary *configDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.appId = configDict[@"AppId"];
    self.contactMail = configDict[@"ContactMail"];
    self.rateAppDelay = configDict[@"RateAppDelayInMinutes"];
    self.flurrySessionID = configDict[@"FlurrySessionID"];
}

@end