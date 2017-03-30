//
//  KeyboardListener.h
//  Restaurant
//
//  Created by AppsFoundation on 2/19/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KeyboardListener : NSObject

@property (assign,nonatomic) UIScrollView *scrollView;
@property (assign,nonatomic) NSLayoutConstraint *contraint;

- (id)initWithScrollView:(UIScrollView *)scrollView andConstraint:(NSLayoutConstraint *)contraint;

@end