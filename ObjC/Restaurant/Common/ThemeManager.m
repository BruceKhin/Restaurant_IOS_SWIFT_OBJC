//
//  ThemeManager.m
//  Restaurants
//
//  Created by AppsFoundation on 1/26/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "ThemeManager.h"
#import <UIKit/UIKit.h>

@implementation ThemeManager

+ (void)applyNavigationBarTheme {
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                            NSFontAttributeName: [UIFont fontWithName:@"KozGoPro-Light" size:18.0f]}];
}

@end
