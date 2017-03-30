//
//  KeyboardListener.m
//  Restaurant
//
//  Created by AppsFoundation on 2/19/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "KeyboardListener.h"

@interface KeyboardListener ()

@property NSInteger contraintCanstant;

@end

@implementation KeyboardListener

- (id)initWithScrollView:(UIScrollView *)scrollView andConstraint:(NSLayoutConstraint *)contraint {
    if (!self) {
        self = [self init];
    }
    
    self.scrollView = scrollView;
    self.contraint = contraint;
    self.contraintCanstant = self.contraint.constant;
    
    //keyboard notifications to change tableview frame
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Keyboard notifications

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    NSValue *kbFrame = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardFrame = [kbFrame CGRectValue];
    
    CGFloat height = keyboardFrame.size.height;
    self.contraint.constant = height;
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.scrollView.superview layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    self.contraint.constant = self.contraintCanstant;
    [UIView animateWithDuration:animationDuration animations:^{
        [self.scrollView.superview layoutIfNeeded];
    }];
}

@end