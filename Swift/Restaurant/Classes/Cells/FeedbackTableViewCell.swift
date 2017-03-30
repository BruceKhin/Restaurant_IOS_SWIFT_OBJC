//
//  FeedbackTableViewCell.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/27/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var feedbackNameLabel: UILabel?
    @IBOutlet weak var feedbackTextLabel: UILabel?
    
    @IBOutlet weak var oneStarImgView: UIImageView?
    @IBOutlet weak var twoStarsImgView: UIImageView?
    @IBOutlet weak var threeStarImgView: UIImageView?
    @IBOutlet weak var fourStarsImgView: UIImageView?
    @IBOutlet weak var fiveStarImgView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    func updateViewForRating(rating: Int) {
        let arrayOfImages: [UIImageView?] = [oneStarImgView, twoStarsImgView, threeStarImgView, fourStarsImgView, fiveStarImgView]
        
        for i in 0 ..< rating {
            let imgView = arrayOfImages[i]!
            imgView.isHidden = false
        }
        
        for i in rating ..< arrayOfImages.count {
            let imgView = arrayOfImages[i]!
            imgView.isHidden = true
        }
    }
}
