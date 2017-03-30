//
//  FeedbackTableViewCell.h
//  Restaurants
//
//  Created by AppsFoundation on 1/24/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackTableViewCell : UITableViewCell

@property (assign,nonatomic) IBOutlet UILabel *feedbackNameLabel;
@property (assign,nonatomic) IBOutlet UILabel *feedbackTextLabel;

@property (assign,nonatomic) IBOutlet UIImageView *oneStarImgView;
@property (assign,nonatomic) IBOutlet UIImageView *twoStarsImgView;
@property (assign,nonatomic) IBOutlet UIImageView *threeStarImgView;
@property (assign,nonatomic) IBOutlet UIImageView *fourStarsImgView;
@property (assign,nonatomic) IBOutlet UIImageView *fiveStarImgView;

- (void)updateViewForRating:(int)rating;

@end