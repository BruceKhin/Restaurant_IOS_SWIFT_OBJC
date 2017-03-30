//
//  AppDelegate.h
//  Restaurants
//
//  Created by AppsFoundation on 1/18/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)sharedDelegate;

//Actions
- (void)openOurMenu;
- (void)openReservation;
- (void)openFindUs;
- (void)openFeedback;

@end