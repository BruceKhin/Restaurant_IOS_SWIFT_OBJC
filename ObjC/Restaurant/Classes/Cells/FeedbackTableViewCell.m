//
//  FeedbackTableViewCell.m
//  Restaurants
//
//  Created by AppsFoundation on 1/24/15.
//  Copyright (c) 2015 AppsFoundation. All rights reserved.
//

#import "FeedbackTableViewCell.h"

@implementation FeedbackTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public

- (void)updateViewForRating:(int)rating {
    NSArray *arrayOfImages= @[self.oneStarImgView,self.twoStarsImgView,self.threeStarImgView,self.fourStarsImgView,self.fiveStarImgView];
    
    for (int i = 0; i < rating; i++) {
        UIImageView *imgView = arrayOfImages[i];
        imgView.hidden = NO;
    }
    
    for (int i = rating; i < arrayOfImages.count; i++) {
        UIImageView *imgView = arrayOfImages[i];
        imgView.hidden = YES;
    }
}

@end
