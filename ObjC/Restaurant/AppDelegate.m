//
//  AppDelegate.m
//  Restaurants
//
//  Created by AppsFoundation on 1/18/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "AppDelegate.h"

#import "Appirater.h"
#import "ConfigurationManager.h"
#import "MSSlidingPanelController.h"
#import "Flurry.h"
#import "ThemeManager.h"

static NSInteger secondsInHour = 60;

typedef enum {
    RateAppDeclined = 0,
    RateAppConfirmed
}RateApp;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Remove comments to add Flurry Analytics more information here - www.flurry.com
    // NSString *flurrySessionID = [[ConfigurationManager sharedManager] flurrySessionID];
    //[Flurry startSession:@"PY8QGYRKC9HTBH8MX2SJ"];
    
    [self initAppiRater];
    [self initRateAppTimer];
    
    [ThemeManager applyNavigationBarTheme];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    return YES;
}

+ (AppDelegate *)sharedDelegate {
    return (AppDelegate *)([UIApplication sharedApplication]).delegate;
}


#pragma mark - Actions

- (void)openOurMenu {
    [self openControllerWithIndentifier:@"ourMenuNavController"];
}

- (void)openReservation {
    [self openControllerWithIndentifier:@"reservationNavController"];
}

- (void)openFindUs {
    [self openControllerWithIndentifier:@"findUsNavController"];
}

- (void)openFeedback{
    [self openControllerWithIndentifier:@"feedbackNavController"];
}

#pragma mark - Private methods

- (void)openControllerWithIndentifier:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    MSSlidingPanelController *rootController = (MSSlidingPanelController *)self.window.rootViewController;
    
    [rootController setCenterViewController:controller];
    [rootController closePanel];
}

- (void)initAppiRater {
    [Appirater appLaunched:YES];
    [Appirater setAppId:[[ConfigurationManager sharedManager] appId]];
    [Appirater setOpenInAppStore:YES];
}

- (void)initRateAppTimer {
    NSNumber *didShowAppRate = [[NSUserDefaults standardUserDefaults] valueForKey:@"showedAppRate"];
    if (!didShowAppRate.boolValue) {
        NSInteger showRateDelay = [[[ConfigurationManager sharedManager] rateAppDelay] integerValue] * secondsInHour;
        [NSTimer scheduledTimerWithTimeInterval:showRateDelay target:self
                                       selector:@selector(showAppRate)
                                       userInfo:nil repeats:NO];
    }
}

- (void)showAppRate {
    NSNumber *didShowAppRate = [[NSUserDefaults standardUserDefaults] valueForKey:@"showedAppRate"];
    if (![didShowAppRate boolValue]) {
        [self rateApp];
        [[NSUserDefaults standardUserDefaults] setValue:@YES forKey:@"showedAppRate"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)rateApp {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Rate the App" message:@"Do you like app?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"No",@"Yes",nil];
    [alertView show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView.title isEqualToString:@"Rate the App"]) {
        switch (buttonIndex) {
            case RateAppDeclined: {
                break;
            }
            case RateAppConfirmed:
                [Appirater rateApp];
                break;
            default:
                break;
        }
    }
}

@end